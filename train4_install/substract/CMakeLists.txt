# Defines version of the CMake - some of features are not backward compatiblem thus it is needed here. 
# At least one for project, in top-level CMake lists.txt required.
# It is good practice to keep it in all CMakeLists.txt files in the structure
cmake_minimum_required(VERSION 3.14)

# Create add library - Object only, as we will not link it. We just need obj file to link it later. That is why we will need to also
# propagate includedirs
add_library(
    substract
    OBJECT
    substract.cpp
    include/substract/substract.h
)

# Define alias library - to not allow to change add lib by its users
add_library(myMathLib::substract ALIAS substract)

# Include current source directory (with header api) as an Interface to the project.
# That will allow user of add to include it via <add.h>.
target_include_directories(substract
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>  # Include directory - for current build interface
    INTERFACE
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>        # And include for install - INTERFACE to propagate
)

# Include compiler dependencies
target_link_libraries(substract
    PRIVATE
        myMathLib::Config
)

# Install only if it will be top-level project
if(CMAKE_PROJECT_NAME STREQUAL myMathLib)
    # Install targets
    install(TARGETS substract
        EXPORT myMathLib-targets  # In export set for myMath
    )

    #And install includes - API - will copy include folder content to installdir
    install(DIRECTORY 
        ${CMAKE_CURRENT_SOURCE_DIR}/include/substract # Source dir
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}  # Destination dir
    )
endif()