// Acquisition from an Intan RHD recording controller (Opal Kelly XEM7310).
//
// This class wraps the Intan API (RHXController) and follows the same sequence as the
// Intan example main.cpp. It has no Python code in it: bindings.cpp exposes it to Python.

#ifndef RHD_ACQUISITION_H
#define RHD_ACQUISITION_H

#include <atomic>
#include <array>
#include <condition_variable>
#include <cstdint>
#include <memory>
#include <mutex>
#include <string>
#include <thread>
#include <vector>

class RHXController;  // Intan API (rhxcontroller.h)

// Sampling frequencies (Hz) accepted by the board, in increasing order.
std::vector<double> availableSampleRatesHz();

class RhdAcquisition
{
public:
    RhdAcquisition();
    ~RhdAcquisition();

    // Opens the first Opal Kelly board found, loads the bitfile and configures the RHD chip.
    // usbVersion is 2 or 3. Returns a short description of the device.
    // Throws std::runtime_error / std::invalid_argument with a readable message.
    std::string connect(const std::string& bitfile, double sampleRateHz, int usbVersion,
                        double cableLengthFeet, const std::vector<int>& portPatches);
    void disconnect();
    bool isConnected() const;

    // Starts a recording of numSamples samples per channel in a background thread.
    // (Rounded up to a whole number of data blocks.)
    void start(unsigned int numSamples);
    void requestStop();          // does not wait: poll isAcquiring()
    bool isAcquiring() const;

    // Moves the data received since the last call into the two vectors.
    // times: seconds since the first sample. samples: microvolts, numChannels() values per time.
    void takeData(std::vector<double>& times, std::vector<float>& samples);

    // Returns (and clears) the last error raised by the acquisition thread, or "".
    std::string takeError();

    double sampleRateHz() const { return sampleRate_; }
    int numChannels() const { return numStreams_ * channelsPerStream_; }

private:
    std::unique_ptr<RHXController> controller_;
    double sampleRate_ = 0.0;
    int numStreams_ = 0;
    int channelsPerStream_ = 0;
    int samplesPerBlock_ = 0;
    unsigned int blockSizeInWords_ = 0;

    std::thread thread_;
    std::atomic<bool> acquiring_{false};
    std::atomic<bool> stopRequested_{false};

    std::thread ledThread_;
    std::mutex ledMutex_;
    std::condition_variable ledWake_;
    bool stopLeds_ = true; // protected by ledMutex_
    void ledLoop(std::array<bool, 8> ports);
    void stopLedThread();

    std::mutex dataMutex_;           // protects times_, samples_ and error_
    std::vector<double> times_;
    std::vector<float> samples_;
    std::string error_;

    bool haveFirstTimestamp_ = false;  // used by the acquisition thread only
    uint32_t firstTimestamp_ = 0;

    void acquisitionLoop(unsigned int totalSamples);
    bool readAvailableBlocks(bool store);
    void stopBoard(unsigned int totalSamples);
    void joinThread();
    void setError(const std::string& message);
};

#endif // RHD_ACQUISITION_H
