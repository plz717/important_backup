# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

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

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zero/code/g2o/g2o

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zero/code/g2o/g2o/build

# Include any dependencies generated for this target.
include types/sba/CMakeFiles/types_sba.dir/depend.make

# Include the progress variables for this target.
include types/sba/CMakeFiles/types_sba.dir/progress.make

# Include the compile flags for this target's objects.
include types/sba/CMakeFiles/types_sba.dir/flags.make

types/sba/CMakeFiles/types_sba.dir/types_sba.cpp.o: types/sba/CMakeFiles/types_sba.dir/flags.make
types/sba/CMakeFiles/types_sba.dir/types_sba.cpp.o: ../types/sba/types_sba.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zero/code/g2o/g2o/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object types/sba/CMakeFiles/types_sba.dir/types_sba.cpp.o"
	cd /home/zero/code/g2o/g2o/build/types/sba && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/types_sba.dir/types_sba.cpp.o -c /home/zero/code/g2o/g2o/types/sba/types_sba.cpp

types/sba/CMakeFiles/types_sba.dir/types_sba.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/types_sba.dir/types_sba.cpp.i"
	cd /home/zero/code/g2o/g2o/build/types/sba && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/zero/code/g2o/g2o/types/sba/types_sba.cpp > CMakeFiles/types_sba.dir/types_sba.cpp.i

types/sba/CMakeFiles/types_sba.dir/types_sba.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/types_sba.dir/types_sba.cpp.s"
	cd /home/zero/code/g2o/g2o/build/types/sba && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/zero/code/g2o/g2o/types/sba/types_sba.cpp -o CMakeFiles/types_sba.dir/types_sba.cpp.s

types/sba/CMakeFiles/types_sba.dir/types_sba.cpp.o.requires:
.PHONY : types/sba/CMakeFiles/types_sba.dir/types_sba.cpp.o.requires

types/sba/CMakeFiles/types_sba.dir/types_sba.cpp.o.provides: types/sba/CMakeFiles/types_sba.dir/types_sba.cpp.o.requires
	$(MAKE) -f types/sba/CMakeFiles/types_sba.dir/build.make types/sba/CMakeFiles/types_sba.dir/types_sba.cpp.o.provides.build
.PHONY : types/sba/CMakeFiles/types_sba.dir/types_sba.cpp.o.provides

types/sba/CMakeFiles/types_sba.dir/types_sba.cpp.o.provides.build: types/sba/CMakeFiles/types_sba.dir/types_sba.cpp.o

types/sba/CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.o: types/sba/CMakeFiles/types_sba.dir/flags.make
types/sba/CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.o: ../types/sba/types_six_dof_expmap.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zero/code/g2o/g2o/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object types/sba/CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.o"
	cd /home/zero/code/g2o/g2o/build/types/sba && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.o -c /home/zero/code/g2o/g2o/types/sba/types_six_dof_expmap.cpp

types/sba/CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.i"
	cd /home/zero/code/g2o/g2o/build/types/sba && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/zero/code/g2o/g2o/types/sba/types_six_dof_expmap.cpp > CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.i

types/sba/CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.s"
	cd /home/zero/code/g2o/g2o/build/types/sba && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/zero/code/g2o/g2o/types/sba/types_six_dof_expmap.cpp -o CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.s

types/sba/CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.o.requires:
.PHONY : types/sba/CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.o.requires

types/sba/CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.o.provides: types/sba/CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.o.requires
	$(MAKE) -f types/sba/CMakeFiles/types_sba.dir/build.make types/sba/CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.o.provides.build
.PHONY : types/sba/CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.o.provides

types/sba/CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.o.provides.build: types/sba/CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.o

# Object files for target types_sba
types_sba_OBJECTS = \
"CMakeFiles/types_sba.dir/types_sba.cpp.o" \
"CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.o"

# External object files for target types_sba
types_sba_EXTERNAL_OBJECTS =

types/sba/libtypes_sba.a: types/sba/CMakeFiles/types_sba.dir/types_sba.cpp.o
types/sba/libtypes_sba.a: types/sba/CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.o
types/sba/libtypes_sba.a: types/sba/CMakeFiles/types_sba.dir/build.make
types/sba/libtypes_sba.a: types/sba/CMakeFiles/types_sba.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libtypes_sba.a"
	cd /home/zero/code/g2o/g2o/build/types/sba && $(CMAKE_COMMAND) -P CMakeFiles/types_sba.dir/cmake_clean_target.cmake
	cd /home/zero/code/g2o/g2o/build/types/sba && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/types_sba.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
types/sba/CMakeFiles/types_sba.dir/build: types/sba/libtypes_sba.a
.PHONY : types/sba/CMakeFiles/types_sba.dir/build

types/sba/CMakeFiles/types_sba.dir/requires: types/sba/CMakeFiles/types_sba.dir/types_sba.cpp.o.requires
types/sba/CMakeFiles/types_sba.dir/requires: types/sba/CMakeFiles/types_sba.dir/types_six_dof_expmap.cpp.o.requires
.PHONY : types/sba/CMakeFiles/types_sba.dir/requires

types/sba/CMakeFiles/types_sba.dir/clean:
	cd /home/zero/code/g2o/g2o/build/types/sba && $(CMAKE_COMMAND) -P CMakeFiles/types_sba.dir/cmake_clean.cmake
.PHONY : types/sba/CMakeFiles/types_sba.dir/clean

types/sba/CMakeFiles/types_sba.dir/depend:
	cd /home/zero/code/g2o/g2o/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zero/code/g2o/g2o /home/zero/code/g2o/g2o/types/sba /home/zero/code/g2o/g2o/build /home/zero/code/g2o/g2o/build/types/sba /home/zero/code/g2o/g2o/build/types/sba/CMakeFiles/types_sba.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : types/sba/CMakeFiles/types_sba.dir/depend
