# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /repo/Cmake/train3_test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /repo/Cmake/train3_test/build

# Include any dependencies generated for this target.
include test/add/CMakeFiles/add_test.dir/depend.make

# Include the progress variables for this target.
include test/add/CMakeFiles/add_test.dir/progress.make

# Include the compile flags for this target's objects.
include test/add/CMakeFiles/add_test.dir/flags.make

test/add/CMakeFiles/add_test.dir/ut_add.cpp.o: test/add/CMakeFiles/add_test.dir/flags.make
test/add/CMakeFiles/add_test.dir/ut_add.cpp.o: ../test/add/ut_add.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/repo/Cmake/train3_test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/add/CMakeFiles/add_test.dir/ut_add.cpp.o"
	cd /repo/Cmake/train3_test/build/test/add && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/add_test.dir/ut_add.cpp.o -c /repo/Cmake/train3_test/test/add/ut_add.cpp

test/add/CMakeFiles/add_test.dir/ut_add.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/add_test.dir/ut_add.cpp.i"
	cd /repo/Cmake/train3_test/build/test/add && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /repo/Cmake/train3_test/test/add/ut_add.cpp > CMakeFiles/add_test.dir/ut_add.cpp.i

test/add/CMakeFiles/add_test.dir/ut_add.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/add_test.dir/ut_add.cpp.s"
	cd /repo/Cmake/train3_test/build/test/add && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /repo/Cmake/train3_test/test/add/ut_add.cpp -o CMakeFiles/add_test.dir/ut_add.cpp.s

# Object files for target add_test
add_test_OBJECTS = \
"CMakeFiles/add_test.dir/ut_add.cpp.o"

# External object files for target add_test
add_test_EXTERNAL_OBJECTS =

test/add/add_test: test/add/CMakeFiles/add_test.dir/ut_add.cpp.o
test/add/add_test: test/add/CMakeFiles/add_test.dir/build.make
test/add/add_test: add/libadd.a
test/add/add_test: /usr/local/lib/libgtest.a
test/add/add_test: /usr/local/lib/libgtest_main.a
test/add/add_test: /usr/local/lib/libgtest.a
test/add/add_test: test/add/CMakeFiles/add_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/repo/Cmake/train3_test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable add_test"
	cd /repo/Cmake/train3_test/build/test/add && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/add_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/add/CMakeFiles/add_test.dir/build: test/add/add_test

.PHONY : test/add/CMakeFiles/add_test.dir/build

test/add/CMakeFiles/add_test.dir/clean:
	cd /repo/Cmake/train3_test/build/test/add && $(CMAKE_COMMAND) -P CMakeFiles/add_test.dir/cmake_clean.cmake
.PHONY : test/add/CMakeFiles/add_test.dir/clean

test/add/CMakeFiles/add_test.dir/depend:
	cd /repo/Cmake/train3_test/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /repo/Cmake/train3_test /repo/Cmake/train3_test/test/add /repo/Cmake/train3_test/build /repo/Cmake/train3_test/build/test/add /repo/Cmake/train3_test/build/test/add/CMakeFiles/add_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/add/CMakeFiles/add_test.dir/depend
