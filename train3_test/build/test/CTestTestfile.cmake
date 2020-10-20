# CMake generated Testfile for 
# Source directory: /repo/Cmake/train3_test/test
# Build directory: /repo/Cmake/train3_test/build/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(ut_mymath "/repo/Cmake/train3_test/build/test/mymath_test")
set_tests_properties(ut_mymath PROPERTIES  _BACKTRACE_TRIPLES "/repo/Cmake/train3_test/test/CMakeLists.txt;28;add_test;/repo/Cmake/train3_test/test/CMakeLists.txt;0;")
subdirs("add")
subdirs("substract")
