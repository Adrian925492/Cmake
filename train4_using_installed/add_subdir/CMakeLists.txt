# Defines version of the CMake - some of features are not backward compatiblem thus it is needed here. 
# At least one for project, in top-level CMake lists.txt required.
# It is good practice to keep it in all CMakeLists.txt files in the structure
cmake_minimum_required(VERSION 3.14)

# Define project name
project(myMathLib VERSION 1.0.0)

# Include settings
include(config/cmake_config.cmake)

# Enable test module - in top - level CMakeLists.txt
include(CTest)

# Add subdirectory of the package - just like it woud be git submodule 
add_subdirectory(add)
add_subdirectory(substract)
add_subdirectory(myMath)

# Include test subdirectory
if(BUILD_TESTING)
    add_subdirectory(test)
endif()

# Create exec
add_executable(myMathLib main.cpp)
target_link_libraries(
    myMathLib
    PRIVATE
        myMathLib::myMath
)

