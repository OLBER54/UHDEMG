#ifndef NOMINMAX
#define NOMINMAX
#endif

#include "rhd_acquisition.h"
#include "led_pattern.h"

#include <algorithm>
#include <chrono>
#include <cmath>
#include <deque>
#include <stdexcept>

#include "okFrontPanel.h"
#include "rhxcontroller.h"
#include "rhxdatablock.h"
#include "rhxglobals.h"
#include "rhxregisters.h"

namespace {

// Amplifier settings: same values as the Intan example (main.cpp). Edit here to change them.
const double kDspCutoffHz = 10.0;
const double kLowerBandwidthHz = 1.0;
const double kUpperBandwidthHz = 7500.0;

// Number of commands in each auxiliary command list (as in the example)
const int kCommandListLength = 128;

// RHD amplifier samples are unsigned 16-bit numbers: microvolts = 0.195 * (value - 32768)
// (this is the conversion used by Intan's readbin.m; check it there if in doubt)
const float kMicrovoltsPerBit = 0.195f;
const int kAmplifierOffset = 32768;

void sleepMs(int ms)
{
    std::this_thread::sleep_for(std::chrono::milliseconds(ms));
}

void waitWhileRunning(RHXController& controller, int timeoutMs, const char* message)
{
    const auto deadline = std::chrono::steady_clock::now() + std::chrono::milliseconds(timeoutMs);
    while (controller.isRunning()) {
        if (std::chrono::steady_clock::now() > deadline)
            throw std::runtime_error(message);
        sleepMs(1);
    }
}

} // namespace


std::vector<double> availableSampleRatesHz()
{
    std::vector<double> rates;
    for (int i = SampleRate1000Hz; i <= SampleRate30000Hz; ++i)
        rates.push_back(AbstractRHXController::getSampleRate(static_cast<AmplifierSampleRate>(i)));
    return rates;
}


RhdAcquisition::RhdAcquisition() {}

RhdAcquisition::~RhdAcquisition()
{
    try {
        disconnect();
    } catch (...) {
    }
}

bool RhdAcquisition::isConnected() const
{
    return controller_ != nullptr;
}

bool RhdAcquisition::isAcquiring() const
{
    return acquiring_.load();
}

void RhdAcquisition::setError(const std::string& message)
{
    std::lock_guard<std::mutex> lock(dataMutex_);
    error_ = message;
}

std::string RhdAcquisition::takeError()
{
    std::lock_guard<std::mutex> lock(dataMutex_);
    std::string message;
    message.swap(error_);
    return message;
}

void RhdAcquisition::joinThread()
{
    if (thread_.joinable())
        thread_.join();
}


// ----------------------------------------------------------------------
// Connection: same steps as the Intan example main.cpp
// ----------------------------------------------------------------------
std::string RhdAcquisition::connect(const std::string& bitfile, double sampleRateHz, int usbVersion,
                                    double cableLengthFeet, const std::vector<int>& portPatches)
{
    if (controller_)
        throw std::runtime_error("Already connected.");

    if (portPatches.size() != 8)
        throw std::invalid_argument("Specify patch counts for all eight ports A-H.");
    int totalPatches = 0;
    for (int port = 0; port < 8; ++port) {
        if (portPatches[port] < 0 || portPatches[port] > 2)
            throw std::invalid_argument("Each port must have 0, 1 or 2 patches.");
        if (usbVersion == 2 && port >= 4 && portPatches[port] != 0)
            throw std::invalid_argument("Ports E-H require USB 3.0.");
        totalPatches += portPatches[port];
    }
    if (totalPatches == 0)
        throw std::invalid_argument("At least one patch is required.");

    ControllerType type;
    if (usbVersion == 3)
        type = ControllerRecordUSB3;
    else if (usbVersion == 2)
        type = ControllerRecordUSB2;
    else
        throw std::invalid_argument("The USB version must be 2 or 3.");

    const AmplifierSampleRate rate = AbstractRHXController::nearestSampleRate(sampleRateHz);
    if (std::fabs(AbstractRHXController::getSampleRate(rate) - sampleRateHz) > 0.01 * sampleRateHz)
        throw std::invalid_argument("This sampling frequency is not supported by the board.");

    // If anything below fails, this object is destroyed and the board is released.
    std::unique_ptr<RHXController> controller(new RHXController(type, rate));

    const std::vector<std::string> devices = controller->listAvailableDeviceSerials();
    if (devices.empty())
        throw std::runtime_error("No Opal Kelly device found. Check the USB cable and that no other "
                                 "program is using the board.");

    if (controller->open(devices[0]) < 0)
        throw std::runtime_error("Could not open the Opal Kelly device " + devices[0] + ".");

    if (!controller->uploadFPGABitfile(bitfile))
        throw std::runtime_error("Could not upload the FPGA bitfile '" + bitfile + "'.");

    controller->initialize();
    const int ledsOff[8] = {};
    controller->setLedDisplay(ledsOff); // Stay off until connection setup succeeds.
    // initialize() resets the sampling rate to 30 kHz; restore the requested rate
    // before calculating cable timing and configuring the RHD registers.
    if (!controller->setSampleRate(rate))
        throw std::runtime_error("Could not set the requested sampling frequency.");
    // USB3 assigns two streams to each MISO line: the even stream is used
    // by a 32-channel chip; its odd DDR partner is only for 64-channel chips.
    // Each port has two MISO lines, so its two 32-channel patches use 4*p and 4*p+2.
    for (int stream = 0; stream < controller->maxNumDataStreams(); ++stream)
        controller->enableDataStream(stream, false);
    for (int port = 0; port < (usbVersion == 3 ? 8 : 4); ++port) {
        if (portPatches[port] == 0)
            continue;
        controller->setCableLengthFeet(static_cast<BoardPort>(port), cableLengthFeet);
        for (int slot = 0; slot < portPatches[port]; ++slot) {
            const int source = 2 * port + slot;
            const int stream = usbVersion == 3 ? 2 * source : source;
            if (usbVersion == 2)
                controller->setDataSource(stream, static_cast<BoardDataSource>(source));
            controller->enableDataStream(stream, true);
        }
    }

    RHXRegisters registers(controller->getType(), controller->getSampleRate());
    std::vector<unsigned int> commandList;
    int commandSequenceLength;

    // AuxCmd1: 1 kHz sine wave for impedance testing
    commandSequenceLength = registers.createCommandListZcheckDac(commandList, 1000.0, 128.0);
    controller->uploadCommandList(commandList, RHXController::AuxCmd1, 0);
    controller->selectAuxCommandLength(RHXController::AuxCmd1, 0, commandSequenceLength - 1);
    controller->selectAuxCommandBankAllPorts(RHXController::AuxCmd1, 0);

    // AuxCmd2: sample the auxiliary ADC inputs
    commandSequenceLength = registers.createCommandListRHDSampleAuxIns(commandList, kCommandListLength);
    controller->uploadCommandList(commandList, RHXController::AuxCmd2);
    controller->selectAuxCommandLength(RHXController::AuxCmd2, 0, commandSequenceLength - 1);
    controller->selectAuxCommandBankAllPorts(RHXController::AuxCmd2, 0);

    // AuxCmd3: configure the RHD chip registers (bank 0) or do that and calibrate the ADC (bank 1)
    registers.setDspCutoffFreq(kDspCutoffHz);
    registers.setLowerBandwidth(kLowerBandwidthHz);
    registers.setUpperBandwidth(kUpperBandwidthHz);

    commandSequenceLength = registers.createCommandListRHDRegisterConfig(commandList, false, kCommandListLength);
    controller->uploadCommandList(commandList, RHXController::AuxCmd3, 0);

    registers.createCommandListRHDRegisterConfig(commandList, true, kCommandListLength);
    controller->uploadCommandList(commandList, RHXController::AuxCmd3, 1);
    controller->selectAuxCommandLength(RHXController::AuxCmd3, 0, commandSequenceLength - 1);
    controller->selectAuxCommandBankAllPorts(RHXController::AuxCmd3, 1);  // bank 1: calibrates the ADC

    // Run 128 samples so that the calibration is performed, and read the resulting data block
    controller->setMaxTimeStep(128);
    controller->setContinuousRunMode(false);
    controller->run();
    waitWhileRunning(*controller, 5000, "The board did not finish the ADC calibration run.");

    RHXDataBlock calibrationBlock(controller->getType(), controller->getNumEnabledDataStreams());
    if (!controller->readDataBlock(&calibrationBlock))
        throw std::runtime_error("Could not read the data block of the calibration run.");

    // From now on use the command sequence without calibration
    controller->selectAuxCommandBankAllPorts(RHXController::AuxCmd3, 0);

    // Remember what is needed to read the data later
    sampleRate_ = controller->getSampleRate();
    numStreams_ = controller->getNumEnabledDataStreams();
    channelsPerStream_ = RHXDataBlock::channelsPerStream(type);
    samplesPerBlock_ = RHXDataBlock::samplesPerDataBlock(type);
    blockSizeInWords_ = RHXDataBlock::dataBlockSizeInWords(type, numStreams_);

    const std::string info = "Opal Kelly device " + devices[0] + ", " + std::to_string(numStreams_) +
           " data stream(s), " + std::to_string(numChannels()) + " channels";
    std::array<bool, 8> ports{};
    for (int port = 0; port < 8; ++port)
        ports[port] = portPatches[port] > 0;
    controller_ = std::move(controller);
    try {
        const auto leds = connectionLedPattern(ports, 0);
        controller_->setLedDisplay(leds.data());
        {
            std::lock_guard<std::mutex> lock(ledMutex_);
            stopLeds_ = false;
        }
        ledThread_ = std::thread(&RhdAcquisition::ledLoop, this, ports);
    } catch (...) {
        disconnect();
        throw;
    }
    return info;
}

void RhdAcquisition::ledLoop(std::array<bool, 8> ports)
{
    const auto start = std::chrono::steady_clock::now();
    auto previous = connectionLedPattern(ports, 0);
    try {
        std::unique_lock<std::mutex> lock(ledMutex_);
        while (!ledWake_.wait_for(lock, std::chrono::milliseconds(25), [this] { return stopLeds_; })) {
            const auto elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(
                std::chrono::steady_clock::now() - start).count();
            const auto leds = connectionLedPattern(ports, elapsed);
            if (leds != previous) {
                // RHXController serializes USB access with its internal mutex,
                // including acquisition reads and LED writes.
                controller_->setLedDisplay(leds.data());
                previous = leds;
            }
        }
    } catch (const std::exception& error) {
        setError(std::string("LED update failed: ") + error.what());
    } catch (...) {
        setError("LED update failed.");
    }
}

void RhdAcquisition::stopLedThread()
{
    {
        std::lock_guard<std::mutex> lock(ledMutex_);
        stopLeds_ = true;
    }
    ledWake_.notify_all();
    if (ledThread_.joinable())
        ledThread_.join();
}

void RhdAcquisition::disconnect()
{
    stopLedThread(); // Finish LED writes before releasing the controller.
    if (acquiring_)
        stopRequested_ = true;
    joinThread();

    if (controller_) {
        try {
            int ledArray[8] = {0, 0, 0, 0, 0, 0, 0, 0};
            controller_->setLedDisplay(ledArray);
        } catch (...) {
        }
        controller_.reset();  // closes the device
    }
    sampleRate_ = 0.0;
    numStreams_ = 0;
    channelsPerStream_ = 0;
}


// ----------------------------------------------------------------------
// Acquisition
// ----------------------------------------------------------------------
void RhdAcquisition::start(unsigned int numSamples)
{
    if (!controller_)
        throw std::runtime_error("Not connected to the FPGA.");
    if (acquiring_)
        throw std::runtime_error("An acquisition is already running.");
    if (numSamples == 0)
        throw std::invalid_argument("The number of samples must be greater than 0.");

    joinThread();  // the previous acquisition (if any) is over

    {
        std::lock_guard<std::mutex> lock(dataMutex_);
        times_.clear();
        samples_.clear();
        error_.clear();
    }
    haveFirstTimestamp_ = false;

    // The board works in whole data blocks: round up
    const unsigned int block = static_cast<unsigned int>(samplesPerBlock_);
    const unsigned int totalSamples = ((numSamples + block - 1) / block) * block;

    stopRequested_ = false;
    acquiring_ = true;
    try {
        thread_ = std::thread(&RhdAcquisition::acquisitionLoop, this, totalSamples);
    } catch (...) {
        acquiring_ = false;
        throw;
    }
}

void RhdAcquisition::requestStop()
{
    stopRequested_ = true;
}

// Runs in the background thread
void RhdAcquisition::acquisitionLoop(unsigned int totalSamples)
{
    try {
        controller_->setMaxTimeStep(totalSamples);
        controller_->setContinuousRunMode(false);
        controller_->run();

        while (!stopRequested_) {
            // Check the state first: if the board has stopped, all its data is already in the FIFO.
            const bool running = controller_->isRunning();
            const bool gotData = readAvailableBlocks(true);
            if (!gotData) {
                if (!running)
                    break;  // finished, nothing left to read
                sleepMs(1);
            }
        }

        if (stopRequested_)
            stopBoard(totalSamples);
    } catch (const std::exception& error) {
        setError(error.what());
    } catch (...) {
        setError("Unknown error during the acquisition.");
    }
    acquiring_ = false;
}

// Reads the whole blocks available in the FIFO (at most MaxNumBlocksToRead).
// If store is false, the data is read and thrown away.
bool RhdAcquisition::readAvailableBlocks(bool store)
{
    unsigned int numBlocks = controller_->getNumWordsInFifo() / blockSizeInWords_;
    if (numBlocks == 0)
        return false;
    numBlocks = std::min(numBlocks, static_cast<unsigned int>(MaxNumBlocksToRead));

    std::deque<RHXDataBlock*> queue;
    if (!controller_->readDataBlocks(static_cast<int>(numBlocks), queue))
        return false;

    std::vector<double> times;
    std::vector<float> samples;
    if (store) {
        times.reserve(queue.size() * samplesPerBlock_);
        samples.reserve(queue.size() * samplesPerBlock_ * numChannels());
    }

    for (RHXDataBlock* block : queue) {
        if (store) {
            for (int t = 0; t < samplesPerBlock_; ++t) {
                const uint32_t timestamp = block->timeStamp(t);
                if (!haveFirstTimestamp_) {
                    firstTimestamp_ = timestamp;
                    haveFirstTimestamp_ = true;
                }
                times.push_back(static_cast<double>(static_cast<uint32_t>(timestamp - firstTimestamp_)) /
                                sampleRate_);
                for (int stream = 0; stream < numStreams_; ++stream) {
                    for (int channel = 0; channel < channelsPerStream_; ++channel) {
                        const int raw = block->amplifierData(stream, channel, t);
                        samples.push_back(kMicrovoltsPerBit * static_cast<float>(raw - kAmplifierOffset));
                    }
                }
            }
        }
        delete block;  // the controller allocates the blocks, the caller frees them
    }

    if (store && !times.empty()) {
        std::lock_guard<std::mutex> lock(dataMutex_);
        times_.insert(times_.end(), times.begin(), times.end());
        samples_.insert(samples_.end(), samples.begin(), samples.end());
    }
    return true;
}

// Stops the board before the end of the run (same commands as the Intan evaluation software).
void RhdAcquisition::stopBoard(unsigned int totalSamples)
{
    controller_->setContinuousRunMode(false);
    controller_->setMaxTimeStep(0);

    // Throw away what is still arriving until the board has really stopped. If it ignores the
    // command, it stops by itself at the end of the planned run: wait for that, plus a margin.
    const long long limitMs = static_cast<long long>(1000.0 * totalSamples / sampleRate_) + 5000;
    const auto deadline = std::chrono::steady_clock::now() + std::chrono::milliseconds(limitMs);
    while (controller_->isRunning()) {
        if (!readAvailableBlocks(false))
            sleepMs(1);
        if (std::chrono::steady_clock::now() > deadline) {
            setError("The board did not stop.");
            return;
        }
    }
    while (readAvailableBlocks(false)) {
    }
    controller_->flush();
}

void RhdAcquisition::takeData(std::vector<double>& times, std::vector<float>& samples)
{
    std::lock_guard<std::mutex> lock(dataMutex_);
    times.swap(times_);
    samples.swap(samples_);
    times_.clear();
    samples_.clear();
}
