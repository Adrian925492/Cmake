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

# Include subdrectories - with add and substract library to the cmake tree
# The tree will look like:
#       mymath
#      /  |  \
#    add  |   CONFIG
#      substract
#
add_subdirectory(add)
add_subdirectory(substract)

# Define a library
add_library(myMath  #[can be STATIC or SHARED]
    mymath.h
    mymath.cpp
)

# Define alias library - to not allow to change MyMath lib by its users
# The used form would be myMathLib::myMath
add_library(${CMAKE_PROJECT_NAME}::myMath ALIAS myMath)

# Link dependencies
target_link_libraries(myMath
    PUBLIC  # For current target and targets that will use it
        myMathLib::add      # We want to have "add" public
    PRIVATE # Only for curent target
        myMathLib::Config
        myMathLib::substract
    INTERFACE   # Only for targets that will use it
)

# Create exec
add_executable(hellolib main.cpp)
target_link_libraries(
    hellolib
    PRIVATE
        myMath
)

# Include test subdirectory
if(BUILD_TESTING)
    add_subdirectory(test)
endif()