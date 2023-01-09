cmake_minimum_required(VERSION 3.21)
message("Using toolchain file ${CMAKE_TOOLCHAIN_FILE}.")

project(
        hello_debugger
        VERSION 1.0.0
        DESCRIPTION "A sample CPPDAP debugger."
        LANGUAGES CXX)

include(GNUInstallDirs)

find_package(cppdap CONFIG REQUIRED)

add_executable(${PROJECT_NAME} hello_debugger.cpp)

target_link_libraries(${PROJECT_NAME}
        PRIVATE
        cppdap::cppdap)

install(TARGETS ${PROJECT_NAME}
        DESTINATION "${CMAKE_INSTALL_LIBDIR}")
