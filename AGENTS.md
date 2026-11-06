# Project working rules

These rules concern the UHDEMG app in `Code/DataAPP`. Read `PROJECT_NOTES.md`
before continuing app development, and verify relevant current code rather than
treating the notes as proof of behavior.

## Authorization and collaboration

- The user explicitly requests: never change anything without their permission.
  A direct request to implement a specific change authorizes that change. Questions,
  research requests, and brainstorming do not authorize implementation.
- Read-only investigation is welcome. Explain proposed edits before applying them.
  Be clear when a command will configure, rebuild, or run the application.
- Do not connect to or operate the physical FPGA without authorization for that test.
  Do not close the user's app or terminate their Python processes to unlock a build;
  ask them to close it.
- If a proposed fix fails, restore your own unsuccessful changes as requested by the
  user; preserve unrelated user edits. Report any remaining generated-file changes.
- Keep explanations plain and concise. Distinguish successful compilation, software
  tests, and physical hardware verification.
- Maintain `PROJECT_NOTES.md` with material decisions and completed authorized work.
  Keep proposed ideas explicitly unimplemented until the user asks to implement them.
  Do not copy participant records or other personal data into project notes.

## Project direction

- Primary purpose: acquire multichannel EMG and save it to the computer for offline
  analysis with existing algorithms. Establish their input requirements before
  designing recording/export.
- Preserve acquired signals; distinguish display processing from saved measurements.
- Before implementing major acquisition, recording, synchronization, filtering,
  visualization, or EMG feature functions, evaluate relevant Open Ephys and LibEMG
  capabilities. Reuse only when it actually helps; neither is currently integrated.
- Preserve the user's participant, patch, port assignment, and movement workflow.
- Demo plans and temperature monitoring are not blanket authorization to implement.

## Development reminders

- Python/Tkinter interface; C++/pybind11 acquisition module under `Code/DataAPP/cpp`.
- Use the app's `.venv/Scripts/python.exe` for checks. Python edits need an app restart,
  not a native rebuild. C++ changes require rebuilding the module and restarting.
- Run CMake commands from `Code/DataAPP`. See project notes for commands.
- Do not modify participant files, the real patch inventory, or FPGA gateware as part
  of routine tests. Prefer temporary/fake data and tests that do not access hardware.
