// Python interface (pybind11) of the C++ acquisition code: import rhd_native

#ifndef NOMINMAX
#define NOMINMAX
#endif

#include <pybind11/numpy.h>
#include <pybind11/pybind11.h>
#include <pybind11/stl.h>

#include <cstring>
#include <vector>

#include "rhd_acquisition.h"

namespace py = pybind11;

PYBIND11_MODULE(rhd_native, m)
{
    m.doc() = "Acquisition from an Intan RHD recording controller (Opal Kelly XEM7310)";

    m.def("sample_rates_hz", &availableSampleRatesHz,
          "Sampling frequencies (Hz) accepted by the board.");

    py::class_<RhdAcquisition>(m, "Acquisition")
        .def(py::init<>())

        // These two block for a few seconds: release the GIL so the interface does not freeze
        .def("connect", &RhdAcquisition::connect,
             py::arg("bitfile"), py::arg("sample_rate_hz"), py::arg("usb_version"),
             py::arg("cable_length_feet"), py::arg("port_patches"),
             py::call_guard<py::gil_scoped_release>())
        .def("disconnect", &RhdAcquisition::disconnect,
             py::call_guard<py::gil_scoped_release>())

        .def("is_connected", &RhdAcquisition::isConnected)
        .def("start", &RhdAcquisition::start, py::arg("num_samples"))
        .def("request_stop", &RhdAcquisition::requestStop)
        .def("is_acquiring", &RhdAcquisition::isAcquiring)
        .def("take_error", &RhdAcquisition::takeError)
        .def("sample_rate_hz", &RhdAcquisition::sampleRateHz)
        .def("num_channels", &RhdAcquisition::numChannels)

        // Returns (times, data): times in seconds (1D), data in microvolts (rows = times, columns = channels)
        .def("read_available", [](RhdAcquisition& self) {
            std::vector<double> times;
            std::vector<float> samples;
            self.takeData(times, samples);

            const py::ssize_t rows = static_cast<py::ssize_t>(times.size());
            const py::ssize_t cols = static_cast<py::ssize_t>(self.numChannels());

            py::array_t<double> timesArray(rows);
            py::array_t<float> dataArray(std::vector<py::ssize_t>{rows, cols});
            if (rows > 0 && samples.size() == static_cast<size_t>(rows * cols)) {
                std::memcpy(timesArray.mutable_data(), times.data(), times.size() * sizeof(double));
                std::memcpy(dataArray.mutable_data(), samples.data(), samples.size() * sizeof(float));
            }
            return py::make_tuple(timesArray, dataArray);
        });
}
