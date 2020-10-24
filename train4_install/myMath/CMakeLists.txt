# Defines version of the CMake - some of features are not backward compatiblem thus it is needed here. 
# At least one for project, in top-level CMake lists.txt required.
# It is good practice to keep it in all CMakeLists.txt files in the structure
cmake_minimum_required(VERSION 3.14)

# Define a library
add_library(myMath  #[can be STATIC or SHARED]
    include/myMath/mymath.h
    mymath.cpp
)

# Define alias library - to not allow to change MyMath lib by its users
# The used form would be myMathLib::myMath
add_library(myMath::myMath ALIAS myMath)

# Link dependencies
target_link_libraries(myMath
    PUBLIC  # For current target and targets that will use it
        myMathLib::add      # We want to have "add" public
    PRIVATE # Only for curent target
        myMathLib::Config
        myMathLib::substract
    INTERFACE   # Only for targets that will use it
)

# Include directories
target_include_directories(myMath
    PUBLIC      # For direct build
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    INTERFACE   # For usage as installed lib
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

# Install only if this is top-level project
if (CMAKE_PROJECT_NAME STREQUAL myMathLib)
    # Install targets
    install(TARGETS myMath
        EXPORT myMathLib-targets   # In export set for myMath
    )

    # Install includes
    install(DIRECTORY 
        include/        # Source - header API
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}     # Destination
    )
endif()