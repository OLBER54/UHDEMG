cmake_minimum_required(VERSION 3.20)
project(rhd_native LANGUAGES CXX)

# Same C++ standard as the Intan example
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_BUILD_TYPE Release)
endif()

# --- Python and pybind11 (taken from the Python that runs cmake: use the venv) ---
find_package(Python 3 COMPONENTS Interpreter Development.Module REQUIRED)

if(NOT pybind11_DIR)
    execute_process(
        COMMAND "${Python_EXECUTABLE}" -c "import pybind11; print(pybind11.get_cmake_dir())"
        OUTPUT_VARIABLE pybind11_cmake_dir
        OUTPUT_STRIP_TRAILING_WHITESPACE
        RESULT_VARIABLE pybind11_result)
    if(NOT pybind11_result EQUAL 0 OR NOT pybind11_cmake_dir)
        message(FATAL_ERROR "pybind11 not found. Install it in the venv with: pip install pybind11")
    endif()
    file(TO_CMAKE_PATH "${pybind11_cmake_dir}" pybind11_cmake_dir)
    # Stored in the CMake cache, which is where find_package looks for it
    set(pybind11_DIR "${pybind11_cmake_dir}" CACHE PATH "Folder containing pybind11Config.cmake" FORCE)
    message(STATUS "pybind11 folder: ${pybind11_DIR}")
endif()
find_package(pybind11 CONFIG REQUIRED)

# --- Folders ---
set(INTAN_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third_party/intan)
set(OK_DIR    ${CMAKE_CURRENT_SOURCE_DIR}/third_party/opalkelly)
get_filename_component(NATIVE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../native" ABSOLUTE)
file(MAKE_DIRECTORY ${NATIVE_DIR})

# --- The Python module ---
pybind11_add_module(rhd_native
    src/bindings.cpp
    src/rhd_acquisition.cpp
    ${INTAN_DIR}/abstractrhxcontroller.cpp
    ${INTAN_DIR}/rhxcontroller.cpp
    ${INTAN_DIR}/rhxdatablock.cpp
    ${INTAN_DIR}/rhxregisters.cpp
)

target_include_directories(rhd_native PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src
    ${INTAN_DIR}
    ${OK_DIR}
)

target_link_libraries(rhd_native PRIVATE ${OK_DIR}/lib/okFrontPanel.lib)

# Put the compiled module in native/ (also with Visual Studio, which adds Release/Debug subfolders otherwise)
set_target_properties(rhd_native PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${NATIVE_DIR}
    LIBRARY_OUTPUT_DIRECTORY_RELEASE ${NATIVE_DIR}
    LIBRARY_OUTPUT_DIRECTORY_DEBUG ${NATIVE_DIR}
    LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO ${NATIVE_DIR}
    LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL ${NATIVE_DIR}
)

# The program needs these two files next to the module when it runs
add_custom_command(TARGET rhd_native POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different "${OK_DIR}/okFrontPanel.dll" "${NATIVE_DIR}"
    COMMAND ${CMAKE_COMMAND} -E copy_if_different "${INTAN_DIR}/ConfigRHDController_7310.bit" "${NATIVE_DIR}"
)
