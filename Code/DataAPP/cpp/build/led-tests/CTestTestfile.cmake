# CMake generated Testfile for 
# Source directory: C:/Users/olivi/Documents/Universite Laval/Maitrise/Projet/UHDEMG/Code/DataAPP/cpp/tests
# Build directory: C:/Users/olivi/Documents/Universite Laval/Maitrise/Projet/UHDEMG/Code/DataAPP/cpp/build/led-tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test([=[led_patterns]=] "C:/Users/olivi/Documents/Universite Laval/Maitrise/Projet/UHDEMG/Code/DataAPP/cpp/build/led-tests/Debug/led_pattern_test.exe")
  set_tests_properties([=[led_patterns]=] PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/olivi/Documents/Universite Laval/Maitrise/Projet/UHDEMG/Code/DataAPP/cpp/tests/CMakeLists.txt;6;add_test;C:/Users/olivi/Documents/Universite Laval/Maitrise/Projet/UHDEMG/Code/DataAPP/cpp/tests/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test([=[led_patterns]=] "C:/Users/olivi/Documents/Universite Laval/Maitrise/Projet/UHDEMG/Code/DataAPP/cpp/build/led-tests/Release/led_pattern_test.exe")
  set_tests_properties([=[led_patterns]=] PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/olivi/Documents/Universite Laval/Maitrise/Projet/UHDEMG/Code/DataAPP/cpp/tests/CMakeLists.txt;6;add_test;C:/Users/olivi/Documents/Universite Laval/Maitrise/Projet/UHDEMG/Code/DataAPP/cpp/tests/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test([=[led_patterns]=] "C:/Users/olivi/Documents/Universite Laval/Maitrise/Projet/UHDEMG/Code/DataAPP/cpp/build/led-tests/MinSizeRel/led_pattern_test.exe")
  set_tests_properties([=[led_patterns]=] PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/olivi/Documents/Universite Laval/Maitrise/Projet/UHDEMG/Code/DataAPP/cpp/tests/CMakeLists.txt;6;add_test;C:/Users/olivi/Documents/Universite Laval/Maitrise/Projet/UHDEMG/Code/DataAPP/cpp/tests/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test([=[led_patterns]=] "C:/Users/olivi/Documents/Universite Laval/Maitrise/Projet/UHDEMG/Code/DataAPP/cpp/build/led-tests/RelWithDebInfo/led_pattern_test.exe")
  set_tests_properties([=[led_patterns]=] PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/olivi/Documents/Universite Laval/Maitrise/Projet/UHDEMG/Code/DataAPP/cpp/tests/CMakeLists.txt;6;add_test;C:/Users/olivi/Documents/Universite Laval/Maitrise/Projet/UHDEMG/Code/DataAPP/cpp/tests/CMakeLists.txt;0;")
else()
  add_test([=[led_patterns]=] NOT_AVAILABLE)
endif()
