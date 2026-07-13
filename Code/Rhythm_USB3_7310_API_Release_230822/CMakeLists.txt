cmake_minimum_required(VERSION 3.20)
project(RHD_XEM7310_Test)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(RHD_XEM7310_Test
    main.cpp
    abstractrhxcontroller.cpp
    rhxcontroller.cpp
    rhxdatablock.cpp
    rhxregisters.cpp
)

target_include_directories(RHD_XEM7310_Test PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(RHD_XEM7310_Test PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/lib/okFrontPanel.lib
)

add_custom_command(TARGET RHD_XEM7310_Test POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${CMAKE_CURRENT_SOURCE_DIR}/okFrontPanel.dll
        $<TARGET_FILE_DIR:RHD_XEM7310_Test>
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${CMAKE_CURRENT_SOURCE_DIR}/ConfigRHDController_7310.bit
        $<TARGET_FILE_DIR:RHD_XEM7310_Test>
)