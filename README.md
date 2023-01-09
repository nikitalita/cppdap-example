# CPPDAP-EXAMPLE

## How to build:

1. Install [vcpkg](https://github.com/microsoft/vcpkg)
2. After following the vcpkg installation instructions, run `vcpkg integrate install` and set the `VCPKG_ROOT` environment variable to wherever it is installed
3. When configuring the cmake build:
    * If using VSCode's cmake-tools, ensure .vscode/settings.json has the proper settings for your platform
    * If configuring CMake via commandline, use the option "-DCMAKE_TOOLCHAIN_FILE=$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake",
