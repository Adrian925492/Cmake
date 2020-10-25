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
#       mymath  - myMath
#      /  |  \  
#    add  |   CONFIG
#      substract
#
add_subdirectory(add)
add_subdirectory(substract)
add_subdirectory(myMath)

# # Create exec
# add_executable(hellolib main.cpp)
# target_link_libraries(
#     hellolib
#     PRIVATE
#         myMath
# )

# Include test subdirectory
if(BUILD_TESTING)
    add_subdirectory(test)
endif()

# Install dependencies - only if this is top-level standalone project (ex we do not use it as add_subdirecotry)
if (CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    install(
        EXPORT myMathLib-targets  # Export set file that we want to export
        FILE myMathLibTargets.cmake     # Generated file exposing exported targets
        NAMESPACE myMathLib::           # Expose the namespace - prefix added to all targets. It will be used by default, automatiaclly when we will likt if from other sources.
        # DEstination of myMathLibTargets.cmake file. This is elated to CMAKE_INSTALL_PREFX. It will be installed
        # in like ${CMAKE_INSTALL_PREFIX}/lib/config/myMathLib/myMathLibTargets.cmake
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/myMathLib
    )
endif()