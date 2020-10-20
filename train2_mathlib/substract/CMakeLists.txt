# Defines version of the CMake - some of features are not backward compatiblem thus it is needed here. 
# At least one for project, in top-level CMake lists.txt required.
# It is good practice to keep it in all CMakeLists.txt files in the structure
cmake_minimum_required(VERSION 3.14)

# Create add library (implicitly static)
add_library(
    substract
    substract.cpp
    substract.h
)

# Define alias library - to not allow to change add lib by its users
add_library(${CMAKE_PROJECT_NAME}::substract ALIAS substract)

# Include current source directory (with header api) as an Interface to the project.
# That will allow user of add to include it via <add.h>.
target_include_directories(substract
    INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}
)

# Include compiler dependencies
target_link_libraries(substract
    PRIVATE
        myMathLib::Config
)