# Defines version of the CMake - some of features are not backward compatiblem thus it is needed here. 
# At least one for project, in top-level CMake lists.txt required.
# It is good practice to keep it in all CMakeLists.txt files in the structure
cmake_minimum_required(VERSION 3.14)

configure_file(
    test_data.h.in      # In CMAKE_CURRENT_COURCE_DIR implicitly
    test_data.h         # In CMAKE_CURRENT_BINARY_DIR implicitly
    @ONLY               # Process only @..@ enclosed variables
)

# Add interface lib so anyone could use the properties
add_library(testData INTERFACE)

# Add alias target - for constness condition
add_library(${PROJECT_NAME}::testData ALIAS testData)

# Set dependencies to propagate - include the generated test data file
target_include_directories(testData INTERFACE ${CMAKE_CURRENT_BINARY_DIR})