# Defines version of the CMake - some of features are not backward compatiblem thus it is needed here. 
# At least one for project, in top-level CMake lists.txt required.
# It is good practice to keep it in all CMakeLists.txt files in the structure
cmake_minimum_required(VERSION 3.14)

# Tell CMake to generatr compile_commands.json file
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Tekk CMake to generate Makefile with verbose ability. To get verbose output You will need to run make with "-v" flag.
set(CMAKE_VERBOSE_MAKEFILE ON)

# Basic CMake directories:
# Always available directory specific variables in CMake (absolute paths):
# CMAKE_SOURCE_DIR - top-level CMakeLists.txt file in the structure dir
# CMAKE_BINARY_DIR - top-level build tree path (path, from where we run cmake <path> command). Here build artifacts will come (top level)
# CMAKE_SURRENT_SOURCE_DIR - path to currnet CMakeLists.txt file in build tree
# CMAKE_CURRENT_BINARY_DIR - path to current build directory in tree
# PROJECT_SOURCE_DIR - path to CMakeLists.txt containing most recent project() call
# PROJECT_BINARY_DIR - path in build tree for most recent project() call
# <project_name>_SOURCE_DIR - path to CMakeLists.txt for specified project name (given in project())
# <project_name>_BINARY_DIR - path to build directory corresponding to give project name (given by project() command)
message(STATUS "CMAKE_SOURCE_DIR            = ${CMAKE_SOURCE_DIR}")
message(STATUS "CMAKE_BINARY_DIR            = ${CMAKE_BINARY_DIR}")
message(STATUS "CMAKE_SURRENT_SOURCE_DIR    = ${CMAKE_SURRENT_SOURCE_DIR}")
message(STATUS "CMAKE_CURRENT_BINARY_DIR    = ${CMAKE_CURRENT_BINARY_DIR}")
message(STATUS "PROJECT_SOURCE_DIR          = ${PROJECT_SOURCE_DIR}")
message(STATUS "PROJECT_BINARY_DIR          = ${PROJECT_BINARY_DIR}")
message(STATUS "mymath_SOURCE_DIR           = ${mymath_SOURCE_DIR}")
message(STATUS "mymath_BINARY_DIR           = ${mymath_BINARY_DIR}")

# Compiler setting
# Give explicitly compiler standard
set (CMAKE_CXX_STANDARD 17)

# Turn on error when compiler standard not satisfied
set (CMAKE_CXX_STANDARD_REQUIRED ON)

# Disable compile standard-specific extensions
set (CMAKE_CXX_EXTENSIONS OFF)

# Add INTERFACE type library - will not produce artofacts, used only to propagate properties set 
# for the libarry with INTERFACE prefixes
add_library(Config INTERFACE)

# Add alias library - to not allow to modify Config lib by other that will use it
add_library(${CMAKE_PROJECT_NAME}::Config ALIAS Config)

# Install only if top-level project
if (CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    # Include GNUInstall dirs - so we would know the directories
    include(GNUInstallDirs)

    set(CMAKE_INSTALL_PREFIX ${CMAKE_SOURCE_DIR}/install)

    # Print currently set install dirs
    message(STATUS "CMAKE_INSTALL_PREFIX        = ${CMAKE_INSTALL_PREFIX}")
    message(STATUS "CMAKE_INSTALL_LIBDIR        = ${CMAKE_INSTALL_LIBDIR}")
    message(STATUS "CMAKE_INSTALL_BINARYDIR     = ${CMAKE_INSTALL_BINARYDIR}")
    message(STATUS "CMAKE_INSTALL_INCLUDEDIR    = ${CMAKE_INSTALL_INCLUDEDIR}")

    # Export config file - install it in installdir
    install(
        FILES
            ${CMAKE_CURRENT_SOURCE_DIR}/config/cmake_config.cmake
        DESTINATION
            ${CMAKE_INSTALL_LIBDIR}/config/myMathLib
    )

    # Export target config
    install(TARGETS 
        Config
        EXPORT myMathLib-targets
    )
endif()

# Set compiler settings - standard in that case
target_compile_features(Config INTERFACE
    cxx_std_17
    c_std_11
)

# Set compiler flags
target_compile_options(Config INTERFACE
    -Wall
    $<$<COMPILE_LANGUAGE:CXX>:-Wpedantic> # If the compile lang would be C++, add also -Wpedantic flag
)