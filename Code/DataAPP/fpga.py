"""Link between the user interface and the FPGA.

The pages (Data, Demo) only talk to the classes of this file. There are two interchangeable
versions:

  RhdFpga        the real board, through the compiled C++ module `rhd_native`
                 (built from the cpp/ folder, it lives in the native/ folder)
  SimulatedFpga  fake data, used automatically when the compiled module cannot be loaded,
                 so the interface can be tested without the board

Use create_fpga() to get the right one.
"""
import os
import sys
import time
from pathlib import Path

import numpy as np

NATIVE_DIR = Path(__file__).with_name("native")

# USB type shown in the interface -> (USB version for the API, bitfile name or None)
# The bitfile must be in the native/ folder (the build copies it there).
USB_TYPES = {
    "USB 2.0": (2, None),  # no bitfile available yet for this board: add its name here
    "USB 3.0": (3, "ConfigRHDController_7310.bit"),
}

# Sampling frequencies (Hz) accepted by the board. The real module reports its own list;
# this one is used by the simulation.
SAMPLE_RATES_HZ = [1000, 1250, 1500, 2000, 2500, 3000, 3333.33, 4000, 5000,
                   6250, 8000, 10000, 12500, 15000, 20000, 25000, 30000]

_dll_directory_handle = None  # keeps the DLL folder registered (Windows)


class FpgaError(Exception):
    """Any problem with the FPGA, with a message that can be shown to the user."""


# ----------------------------------------------------------------------
# Common interface
# ----------------------------------------------------------------------
class FpgaBase:
    description = ""

    def __init__(self):
        self.connected = False
        self.params = {}  # parameters given at connection time
        self.sample_rates_hz = list(SAMPLE_RATES_HZ)

    @property
    def sample_rate_hz(self):
        return float(self.params.get("sampling_frequency_hz", 0.0))

    def connect(self, params):
        """Connect to the board. Returns a short description of the device. May take seconds."""
        raise NotImplementedError

    def disconnect(self):
        raise NotImplementedError

    def start(self, duration_s):
        """Start recording for duration_s seconds (returns immediately)."""
        raise NotImplementedError

    def request_stop(self):
        """Ask the recording to stop (returns immediately: poll is_acquiring())."""
        raise NotImplementedError

    def is_acquiring(self):
        raise NotImplementedError

    def read_available(self):
        """Return the data received since the last call as (times, data).

        times: 1D array in seconds, counted from the first sample.
        data:  2D array in microvolts, one row per time and one column per channel.
        """
        raise NotImplementedError

    def take_error(self):
        """Return (and forget) the last error of the recording thread, or an empty string."""
        return ""


# ----------------------------------------------------------------------
# Real board
# ----------------------------------------------------------------------
class RhdFpga(FpgaBase):
    def __init__(self, native):
        super().__init__()
        self._acq = native.Acquisition()
        self.sample_rates_hz = list(native.sample_rates_hz())
        self.description = "real FPGA (module rhd_native)"

    @property
    def sample_rate_hz(self):
        # The rate really used by the board (the closest one to the requested value)
        return float(self._acq.sample_rate_hz()) if self.connected else 0.0

    def connect(self, params):
        usb_version, bitfile = USB_TYPES[params["usb_type"]]
        if bitfile is None:
            raise FpgaError(f"No FPGA bitfile is set up for {params['usb_type']}. "
                            "See USB_TYPES in fpga.py.")
        if not (NATIVE_DIR / bitfile).is_file():
            raise FpgaError(f"Bitfile not found: {NATIVE_DIR / bitfile}")

        # The API opens the bitfile by its name, as a plain (non-Unicode) string. Giving it
        # only the name, with the native folder as working folder, works even when the full
        # path contains accents.
        previous_folder = os.getcwd()
        os.chdir(NATIVE_DIR)
        try:
            info = self._acq.connect(bitfile, params["sampling_frequency_hz"], usb_version,
                                     params["spi_cable_length_ft"], params["port_patches"])
        except (RuntimeError, ValueError) as error:
            raise FpgaError(str(error)) from error
        finally:
            os.chdir(previous_folder)

        self.params = dict(params)
        self.connected = True
        return info

    def disconnect(self):
        self._acq.disconnect()
        self.connected = False
        self.params = {}

    def start(self, duration_s):
        samples = int(round(duration_s * self.sample_rate_hz))
        if samples < 1:
            raise FpgaError("The sample length is too short.")
        try:
            self._acq.start(samples)
        except (RuntimeError, ValueError) as error:
            raise FpgaError(str(error)) from error

    def request_stop(self):
        self._acq.request_stop()

    def is_acquiring(self):
        return self._acq.is_acquiring()

    def read_available(self):
        return self._acq.read_available()

    def take_error(self):
        return self._acq.take_error()


# ----------------------------------------------------------------------
# Simulation (no hardware)
# ----------------------------------------------------------------------
class SimulatedFpga(FpgaBase):
    NUM_CHANNELS = 32
    SIGNAL_HZ = 5.0

    def __init__(self, reason=""):
        super().__init__()
        self.description = "SIMULATED FPGA, no hardware" + (f" ({reason})" if reason else "")
        self._acquiring = False
        self._start_time = 0.0
        self._stop_time = None
        self._total = 0
        self._sent = 0
        self._random = np.random.default_rng()
        self._gains = 1.0 + 0.05 * np.arange(self.NUM_CHANNELS)

    def connect(self, params):
        time.sleep(0.5)  # a real connection takes a moment
        self.NUM_CHANNELS = 32 * sum(params["port_patches"])
        self._gains = 1.0 + 0.05 * np.arange(self.NUM_CHANNELS)
        self.params = dict(params)
        self.connected = True
        return "simulated device (no hardware connected)"

    def disconnect(self):
        self._acquiring = False
        self.connected = False
        self.params = {}

    def start(self, duration_s):
        if not self.connected:
            raise FpgaError("Not connected to the FPGA.")
        self._total = int(round(duration_s * self.sample_rate_hz))
        if self._total < 1:
            raise FpgaError("The sample length is too short.")
        self._sent = 0
        self._start_time = time.monotonic()
        self._stop_time = None
        self._acquiring = True

    def request_stop(self):
        if self._acquiring and self._stop_time is None:
            self._stop_time = time.monotonic()

    def is_acquiring(self):
        if not self._acquiring or self._stop_time is not None:
            return False
        return (time.monotonic() - self._start_time) * self.sample_rate_hz < self._total

    def read_available(self):
        empty = (np.empty(0), np.empty((0, self.NUM_CHANNELS), dtype=np.float32))
        if not self._acquiring:
            return empty
        end = self._stop_time if self._stop_time is not None else time.monotonic()
        due = min(self._total, int((end - self._start_time) * self.sample_rate_hz))
        count = due - self._sent
        if count <= 0:
            return empty
        times = np.arange(self._sent, due) / self.sample_rate_hz
        signal = 100.0 * np.sin(2.0 * np.pi * self.SIGNAL_HZ * times)
        data = signal[:, None] * self._gains[None, :]
        data += 5.0 * self._random.standard_normal((count, self.NUM_CHANNELS))
        self._sent = due
        return times, data.astype(np.float32)


# ----------------------------------------------------------------------
# Choosing the version
# ----------------------------------------------------------------------
def _import_native():
    """Try to load the compiled module. Returns (module, None) or (None, reason)."""
    global _dll_directory_handle
    if NATIVE_DIR.is_dir():
        if str(NATIVE_DIR) not in sys.path:
            sys.path.insert(0, str(NATIVE_DIR))
        if hasattr(os, "add_dll_directory"):  # Windows: where okFrontPanel.dll is looked for
            _dll_directory_handle = os.add_dll_directory(str(NATIVE_DIR))
    try:
        import rhd_native
    except ModuleNotFoundError:
        return None, "compiled module rhd_native not found in the native folder"
    except ImportError as error:
        return None, f"compiled module rhd_native could not be loaded: {error}"
    return rhd_native, None


def create_fpga():
    """Return the real FPGA if the compiled module is available, a simulation otherwise."""
    native, reason = _import_native()
    if native is not None:
        return RhdFpga(native)
    return SimulatedFpga(reason)
