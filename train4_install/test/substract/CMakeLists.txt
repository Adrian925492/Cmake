# Defines version of the CMake - some of features are not backward compatiblem thus it is needed here. 
# At least one for project, in top-level CMake lists.txt required.
# It is good practice to keep it in all CMakeLists.txt files in the structure
cmake_minimum_required(VERSION 3.14)

# Create test binary
add_executable(substract_test
    ut_substract.cpp
)

# Link libraries
target_link_libraries(
    substract_test
    PRIVATE
        myMathLib::Config
        myMathLib::substract
        GTest::gtest
        GTest::gtest_main
)

# Add test binary to ctest
add_test(NAME ut_substract COMMAND substract_test)

# Set test label - property
set_target_properties(substract_test PROPERTIES LABELS ut_substract_label)