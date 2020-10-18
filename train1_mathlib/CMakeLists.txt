# Defines version of the CMake - some of features are not backward compatiblem thus it is needed here. 
# At least one for project, in top-level CMake lists.txt required.
# It is good practice to keep it in all CMakeLists.txt files in the structure
cmake_minimum_required(VERSION 3.14)

# Defines name of the project - for each cmake that will produce the outputs - required.
project(mymath VERSION 0.1.0 LANGUAGES C CXX)

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

# STEP 1: Create add library (implicitly static)
add_library(
    add
    add.c
    add.h
)

# STEP 2: Create substract library (implicitly static)
add_library(
    substract
    substract.h
    substract.cpp
)

# STEP 3.1 - Create shared (explicitly given SHARED) library
add_library(
    mymath
    SHARED
    mymath.h
    mymath.cpp
)

# STEP 3.3 Link include directory (for build only) - source directory - in fact, dir where top level Cmake lays
target_include_directories(
    mymath
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

# STEP 3.3: Link builded libs (add and substract) to mymath shared lib
target_link_libraries(
    mymath
    PUBLIC
        add
    PRIVATE
        substract
)

# STEP4: Build and link main that uses our so lib
add_executable(hellolib main.cpp)
target_link_libraries(
    hellolib
    PRIVATE
        mymath
)