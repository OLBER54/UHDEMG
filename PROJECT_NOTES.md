# UHDEMG project notes

Last updated: 2026-11-03 (America/Toronto).

This is a concise project handoff, not a complete conversation log. Verify current
source before modifying it. Follow `AGENTS.md` for working rules.

## Purpose and priorities

The app records EMG signals and transfers/saves them to a computer for offline
analysis using algorithms the user already has. It is not primarily a gesture
recognition or online analysis project.

Priorities: reliable multichannel acquisition, accurate sampling/timing, channel to
electrode mapping, recording metadata, and useful monitoring. Saving is NOT yet
implemented. The offline algorithms' required file format is still unknown.

## Hardware and environment

- Windows, PowerShell; project app folder: `Code/DataAPP`.
- Opal Kelly XEM7310-A75, with Intan RHD acquisition code and
  `ConfigRHDController_7310.bit`.
- Ports A-H, 0/1/2 patches per port, 32 electrodes per patch (up to 512 configured
  electrodes). User confirmed two patches use TWO SEPARATE 32-channel Intan chips,
  not one 64-channel chip.
- USB3 stream mapping: port index p uses stream 4*p for slot 1 and 4*p+2 for slot 2;
  odd DDR streams are disabled. One-patch configuration uses slot 1.
- One SPI cable length parameter currently applies to all enabled ports.
- USB2 is listed but has no assigned bitfile; real USB2 connection is unavailable.
- Existing environment uses Python 3.14 and a compiled
  `native/rhd_native.cp314-win_amd64.pyd`; do not assume new dependencies support it.
- No independent verification of physically attached chips is implemented: configured
  port usage and patch labels reflect user input, not automatic hardware discovery.

## Current app structure

- `main.py`: main window, shared FPGA and inventory, menu routing.
- `info_setup.py`: combined **Info** page, participant form on the left,
  Configuration on the right; scrollable at smaller window sizes.
- `information.py`: participant form, save/load text files; saving/loading refreshes
  the adjacent configuration, including updates to the same filename.
- `configuration.py`: computes required patches/electrodes and patch #0 position,
  and selects patches from inventory. Current formulas: patches =
  int(((circumference_mm / 5) + 1) / 4), electrodes = patches * 32,
  patch #0 position = forearm_length_mm / 3. These are existing project rules,
  not independently validated scientific recommendations.
- `logs.py`: persistent `patch_inventory.csv`; Add patch and Remove patch (supports
  multiple selection). Usage increment preserves Config selection and prevents an
  immediate duplicate increment of the same selection. Failed saves restore memory.
- `dataAcq.py`: common acquisition interface; parameters, port assignments,
  connection/status, preparation delay, start/stop, console, recording buffers.
- `demo.py`: currently inherits DataAcqPage unchanged. Future Demo views are not built.
- `fpga.py`: real native-module adapter and simulated FPGA fallback. Simulation is
  selected if the native module cannot load, NOT simply if hardware is unplugged.
- `instructions.py`: read-only scrollable viewer of `instructions.txt`; reloads each
  visit. Supports `**bold**`, `<u>underline</u>`, and combined formatting. The user
  authors the text; do not overwrite it.
- `cpp/src/rhd_acquisition.*`, `bindings.cpp`: native acquisition and Python bridge.
- `cpp/src/led_pattern.h`: LED state calculation; `cpp/tests`: LED pattern tests.

Menus: Info, Demo, Data, Logs, Instructions. Default window is 1280x700.

## Acquisition behavior implemented

- Sampling frequency, USB type, SPI cable length, sample duration and preparation
  delay are read on Connect. All these fields and port controls lock while connecting
  or connected, and unlock after disconnection. Changes require reconnecting.
- Each port has a 0/1/2 patch count, per-port electrode count, and selectors for the
  active patch slots. Selectors use the patches selected in Info > Configuration.
- Total electrodes must match Configuration's calculated requirement. Connection is
  rejected for missing configuration, zero patches, incorrect selected-patch count,
  missing assignments, duplicates, or assignments not matching Config selections.
- Successful connection logs patch names per active port. Names are kept in Python
  connection parameters; native code receives patch counts. No recording export
  currently saves these associations.
- Connection loads the bitfile, configures streams, sets cable timing, configures
  chip registers, and runs ADC calibration. It is more than a device-detection call.
- Controller initialization resets sampling to 30 kHz. The code now explicitly
  reapplies the requested rate immediately afterward and checks success.
- Acquired values are returned as samples-by-channels arrays in microvolts, with
  times in seconds. Native acquisition rounds sample counts up to whole data blocks.
- Recording is retained in memory only. Starting another recording replaces that
  page's previous recording; closing the app loses it.
- The graph has MVC-labelled axes but `on_new_data()` is still a TODO. There is no
  actual live signal plotting, MVC calibration/conversion, heatmap or data export.
- Movement names remain placeholders; selected movement is logged at Start.
  The picture area remains a placeholder.

## LED behavior implemented

Port usage means configured patch count > 0. These LEDs are not cable detectors.

| LED | Port pair | Neither | First only | Second only | Both |
| --- | --- | --- | --- | --- | --- |
| 0 | A / B | Off | 0.5 Hz | 2 Hz | On |
| 1 | C / D | Off | 0.5 Hz | 2 Hz | On |
| 2 | E / F | Off | 0.5 Hz | 2 Hz | On |
| 3 | G / H | Off | 0.5 Hz | 2 Hz | On |

- LED 4 is steady on after successful connection, off when normally disconnected.
- LEDs 5-7 remain off; no additional behavior requested.
- 0.5 Hz = 1 s on / 1 s off. 2 Hz = 250 ms on / 250 ms off.
- Native background thread uses a monotonic clock; USB access is serialized by the
  controller. Actual transitions may be delayed by scheduling/USB traffic.
- Disconnect stops/joins LED updates, then clears all LEDs before releasing hardware.
- The code provides on/off control, not selectable LED colors.

## Planned Demo design — brainstorming, NOT authorization to implement

Three submenus/tabs, one visible at a time, with shared acquisition controls:

1. **MVC%**: contraction practice. The relevant muscle region depends on the movement.
   Each movement uses a combination of channels covering that region, with its own
   appropriate MVC reference. Region selection, aggregation, calibration protocol,
   and target display are still undecided.
2. **Heatmap**: activity across all used electrodes; LibEMG is a candidate. Map cells
   to actual physical electrode locations. Amplitude measure, time window, and shared
   versus per-electrode color normalization are undecided.
3. **Raw EMG**: graphs of a selected channel group, not all channels at once. Selection
   can be independent of MVC region; exact controls remain undecided.

Display processing should be separate from signals saved for offline analysis.

## Reuse candidates to evaluate before relevant features

No Open Ephys or LibEMG installation/integration has been performed in this chat.

### Open Ephys

Evaluate for acquisition, recording, file organization, synchronization, filtering,
and general signal inspection. A possible integration is our interface controlling
the running Open Ephys GUI through HTTP and receiving continuous signals via ZMQ.
That is an option, not a decided migration. Hardware/gateware compatibility and
custom features such as LEDs must be checked. C++ plugins are not standalone
Python widgets. Avoid duplicate direct control of the same board.

- Overview: https://open-ephys.org/gui
- Relevant Intan plugin: https://open-ephys.github.io/gui-docs/User-Manual/Plugins/RHD-Rec-Controller.html
- Remote control: https://open-ephys.github.io/gui-docs/User-Manual/Remote-control.html
- Streaming: https://open-ephys.github.io/gui-docs/User-Manual/Plugins/ZMQ-Interface.html
- Recording: https://open-ephys.github.io/gui-docs/User-Manual/Recording-data.html
- Binary format: https://open-ephys.github.io/gui-docs/User-Manual/Data-formats/Binary-format.html
- Python tools: https://github.com/open-ephys/open-ephys-python-tools

### LibEMG

Evaluate selected Python functions for filtering, windowing, amplitude features
(RMS/MAV), live heatmaps, and guided recording/gesture assets. Classification and
regression exist but are not a current project objective. RMS alone is not MVC%:
calibration and normalization still need a defined protocol. Current custom Intan
setup was not listed on the hardware page reviewed; adapting arrays or streaming
is possible but untested. Check Python 3.14 compatibility and high-channel-count
performance before adoption. Do not blindly apply example filter settings.

- Overview: https://libemg.github.io/libemg/
- Features: https://libemg.github.io/libemg/documentation/features/features.html
- Filters: https://libemg.github.io/libemg/documentation/filtering/filtering.html
- Heatmaps: https://libemg.github.io/libemg/documentation/visualization/visualization.html
- Guided training: https://libemg.github.io/libemg/documentation/screen_guided_training/sgt.html
- Hardware: https://libemg.github.io/libemg/documentation/supported_hardware/supported_hardware.html

## Deferred bonus: temperature

The user explicitly deferred temperature monitoring until core functions work.
Artix-7 has an internal temperature sensor accessible through XADC. Whether the
current Intan bitfile exposes a software-readable value is unconfirmed. The bundled
FrontPanel header includes GetDeviceSensors, but temperature support through that
API on this board has NOT been established. Intan chip temperature references do
not represent FPGA temperature. No temperature feature has been implemented.

- Board: https://docs.opalkelly.com/xem7310/
- Device sensors: https://docs.opalkelly.com/fpsdk/frontpanel-api/device-sensors/
- XADC: https://www.amd.com/content/dam/xilinx/support/documents/user_guides/ug480_7Series_XADC.pdf

## Build and known fixes

From `Code/DataAPP` in PowerShell:

```powershell
cmake -S cpp -B cpp/build "-DPython_EXECUTABLE=$PWD\.venv\Scripts\python.exe"
cmake --build cpp/build --config Release
```

- CMake finds pybind11 using Python's `print(pybind11.get_cmake_dir())`; the CLI
  `-m pybind11 --cmakedir` returned literal quotes around paths containing spaces.
- `bindings.cpp` must include `pybind11/stl.h` for std::vector-to-Python conversion.
- Build copies the native module and required DLL/bitfile into `native`.
- A running Python app can lock the .pyd and cause LNK1104. Ask the user to close it,
  then rebuild. A successful build requires restarting the app to load the new module.

LED tests (no hardware needed):

```powershell
cmake -S cpp/tests -B cpp/build/led-tests
cmake --build cpp/build/led-tests --config Release
ctest --test-dir cpp/build/led-tests -C Release --output-on-failure
```

## Verification record and outstanding questions

- User confirmed app opens and sampling-rate fix works on hardware (requested
  2000 Hz had previously become 30000 Hz).
- User confirmed Instructions, text styling, and combined Info layout work.
- Port-count/assignment validation, simulated 96-channel data, parameter locking,
  and UI synchronization passed software checks using fake/hidden UI state.
- Multi-port physical acquisition has not been explicitly confirmed by the user.
- LED code built successfully; tests covered all 256 port-usage combinations,
  frequencies, duty cycles and boundaries. Physical LED behavior is not yet confirmed.
- Remove patch was implemented and syntax checked; its original persistence test
  was blocked by temporary-directory permissions and escalation was declined.
  Do not claim that original persistence test passed.
- Outstanding: offline algorithm input format; saving strategy and metadata;
  physical channel layout; Demo region/calibration choices; multi-port data quality;
  library compatibility/performance. These are not all currently authorized tasks.
