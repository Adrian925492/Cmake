# Defines version of the CMake - some of features are not backward compatiblem thus it is needed here. 
# At least one for project, in top-level CMake lists.txt required.
# It is good practice to keep it in all CMakeLists.txt files in the structure
cmake_minimum_required(VERSION 3.14)

# Define project name
project(hellolib VERSION 1.0.0)

# set CMAKE_PREFIX_PATH - for find_package
set(CMAKE_PREFIX_PATH /repo/Cmake/train4_install/install)

# Find installed package
find_package(myMathLib REQUIRED)

# Create exec
add_executable(hellolib main.cpp)
target_link_libraries(
    hellolib
    PRIVATE
        myMathLib::myMath
)

