# Defines version of the CMake - some of features are not backward compatiblem thus it is needed here. 
# At least one for project, in top-level CMake lists.txt required.
# It is good practice to keep it in all CMakeLists.txt files in the structure
cmake_minimum_required(VERSION 3.14)

# Create test binary
add_executable(add_test
    ut_add.cpp
)

# Link libraries
target_link_libraries(
    add_test
    PRIVATE
        myMathLib::Config
        myMathLib::add
        GTest::gtest
        GTest::gtest_main
)

# Add test binary to ctest, add set workdir
add_test(NAME ut_add COMMAND add_test WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

# Set test label - property
set_target_properties(add_test PROPERTIES LABELS ut_add_label)