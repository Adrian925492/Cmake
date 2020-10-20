# Defines version of the CMake - some of features are not backward compatiblem thus it is needed here. 
# At least one for project, in top-level CMake lists.txt required.
# It is good practice to keep it in all CMakeLists.txt files in the structure
cmake_minimum_required(VERSION 3.14)

find_package(GTest REQUIRED CONFIG)

# Includetests of other modules
add_subdirectory(add)
add_subdirectory(substract)

# Include test data
add_subdirectory(test_data)

# Create test binary
add_executable(mymath_test
    ut_mymath.cpp
)

# Link libraries
target_link_libraries(
    mymath_test
    PRIVATE
        myMathLib::Config
        myMathLib::myMath
        GTest::gtest
        GTest::gtest_main
)

# Add test binary to ctest
add_test(NAME ut_mymath COMMAND mymath_test)

# Set test label - property
set_target_properties(mymath_test PROPERTIES LABELS ut_mymath_label)