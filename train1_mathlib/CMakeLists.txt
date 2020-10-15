cmake_minimum_required(VERSION 3.14)

project(mymath VERSION 0.1.0 LANGUAGES C CXX)

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