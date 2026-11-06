RHD Interface XEM7310 API example program

Summary
-------
This program demonstrates the use of Intan's API to configure an Opal Kelly XEM7310 board as an
RHD Recording Controller, connect to an RHD chip, acquire some data, and save data
to disk.

The example itself is in the 'main.cpp' file, and describes the detailed operation in comments.

Building/Running
--------
In order for this example to compile and run correctly, cmake or qmake can be used for building.
As long as #define USE_QT is left commented in rhxglobals.h, no Qt-specific features are used.
For a successful build, ensure that all the files in the Intan API (abstractrhxcontroller .h/.cpp,
rhxcontroller .h/.cpp, rhxdatablock .h/.cpp, rhxregisters .h/.cpp, and rhxglobals.h) and okFrontPanel.h
can be accessed, and that okFrontPanel.lib in the lib/ directory is used for building.

In order to actually run the program, ensure that okFrontPanel.dll is in the same directory as 
the built executable file, and that a valid ConfigRHDController_7310.bit file is also in this directory.
Successful running of this program will connect to the first Opal Kelly device detected (which
should be an Opal Kelly XEM7310 - ensure other Opal Kelly devices are disconnected if necessary),
upload the bit file, and use the Rhythm7310 interface to communicate with an RHD chip.

Checking Saved Data
-------------------
Saved data can be verified by loading into Matlab using the provided 'readbin.m' script, and data from various channels
will be stored in variables like 'timestamp', 'amplifier_data', 'boardADC_data', etc. This can be plotted
to verify that valid data has been successfully acquired.