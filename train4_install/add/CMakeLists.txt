# Defines version of the CMake - some of features are not backward compatiblem thus it is needed here. 
# At least one for project, in top-level CMake lists.txt required.
# It is good practice to keep it in all CMakeLists.txt files in the structure
cmake_minimum_required(VERSION 3.14)

# Define project - as we use other language, we can define new project here
project(add VERSION 1.0.0 LANGUAGES C)

# Create add library (explicitly static)
add_library(
    add
    STATIC
    add.c
    include/add/add.h
)

# Define alias library - to not allow to change add lib by its users
add_library(myMathLib::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

# Include current source directory (with header api) as an Interface to the project.
# That will allow user of add to include it via <add.h>.
target_include_directories(add
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>      # If used directly from sources - include "include" directory
)

# Include compiler dependencies and settings
target_link_libraries(${PROJECT_NAME}
    PRIVATE
        myMathLib::Config
)

# Install - only if it would be top-level project
if (CMAKE_PROJECT_NAME STREQUAL myMathLib)  # If that project is MyMath than install the sublibrary add
    #Install add lib target as a part of myMath libs target
    install(TARGETS add
        EXPORT myMathLib-targets  # Export target to export set MyMath
    )
endif()