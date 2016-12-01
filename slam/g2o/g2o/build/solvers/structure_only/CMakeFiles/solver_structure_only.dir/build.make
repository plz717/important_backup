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
include solvers/structure_only/CMakeFiles/solver_structure_only.dir/depend.make

# Include the progress variables for this target.
include solvers/structure_only/CMakeFiles/solver_structure_only.dir/progress.make

# Include the compile flags for this target's objects.
include solvers/structure_only/CMakeFiles/solver_structure_only.dir/flags.make

solvers/structure_only/CMakeFiles/solver_structure_only.dir/structure_only.cpp.o: solvers/structure_only/CMakeFiles/solver_structure_only.dir/flags.make
solvers/structure_only/CMakeFiles/solver_structure_only.dir/structure_only.cpp.o: ../solvers/structure_only/structure_only.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zero/code/g2o/g2o/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object solvers/structure_only/CMakeFiles/solver_structure_only.dir/structure_only.cpp.o"
	cd /home/zero/code/g2o/g2o/build/solvers/structure_only && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/solver_structure_only.dir/structure_only.cpp.o -c /home/zero/code/g2o/g2o/solvers/structure_only/structure_only.cpp

solvers/structure_only/CMakeFiles/solver_structure_only.dir/structure_only.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/solver_structure_only.dir/structure_only.cpp.i"
	cd /home/zero/code/g2o/g2o/build/solvers/structure_only && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/zero/code/g2o/g2o/solvers/structure_only/structure_only.cpp > CMakeFiles/solver_structure_only.dir/structure_only.cpp.i

solvers/structure_only/CMakeFiles/solver_structure_only.dir/structure_only.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/solver_structure_only.dir/structure_only.cpp.s"
	cd /home/zero/code/g2o/g2o/build/solvers/structure_only && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/zero/code/g2o/g2o/solvers/structure_only/structure_only.cpp -o CMakeFiles/solver_structure_only.dir/structure_only.cpp.s

solvers/structure_only/CMakeFiles/solver_structure_only.dir/structure_only.cpp.o.requires:
.PHONY : solvers/structure_only/CMakeFiles/solver_structure_only.dir/structure_only.cpp.o.requires

solvers/structure_only/CMakeFiles/solver_structure_only.dir/structure_only.cpp.o.provides: solvers/structure_only/CMakeFiles/solver_structure_only.dir/structure_only.cpp.o.requires
	$(MAKE) -f solvers/structure_only/CMakeFiles/solver_structure_only.dir/build.make solvers/structure_only/CMakeFiles/solver_structure_only.dir/structure_only.cpp.o.provides.build
.PHONY : solvers/structure_only/CMakeFiles/solver_structure_only.dir/structure_only.cpp.o.provides

solvers/structure_only/CMakeFiles/solver_structure_only.dir/structure_only.cpp.o.provides.build: solvers/structure_only/CMakeFiles/solver_structure_only.dir/structure_only.cpp.o

# Object files for target solver_structure_only
solver_structure_only_OBJECTS = \
"CMakeFiles/solver_structure_only.dir/structure_only.cpp.o"

# External object files for target solver_structure_only
solver_structure_only_EXTERNAL_OBJECTS =

solvers/structure_only/libsolver_structure_only.a: solvers/structure_only/CMakeFiles/solver_structure_only.dir/structure_only.cpp.o
solvers/structure_only/libsolver_structure_only.a: solvers/structure_only/CMakeFiles/solver_structure_only.dir/build.make
solvers/structure_only/libsolver_structure_only.a: solvers/structure_only/CMakeFiles/solver_structure_only.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libsolver_structure_only.a"
	cd /home/zero/code/g2o/g2o/build/solvers/structure_only && $(CMAKE_COMMAND) -P CMakeFiles/solver_structure_only.dir/cmake_clean_target.cmake
	cd /home/zero/code/g2o/g2o/build/solvers/structure_only && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/solver_structure_only.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
solvers/structure_only/CMakeFiles/solver_structure_only.dir/build: solvers/structure_only/libsolver_structure_only.a
.PHONY : solvers/structure_only/CMakeFiles/solver_structure_only.dir/build

solvers/structure_only/CMakeFiles/solver_structure_only.dir/requires: solvers/structure_only/CMakeFiles/solver_structure_only.dir/structure_only.cpp.o.requires
.PHONY : solvers/structure_only/CMakeFiles/solver_structure_only.dir/requires

solvers/structure_only/CMakeFiles/solver_structure_only.dir/clean:
	cd /home/zero/code/g2o/g2o/build/solvers/structure_only && $(CMAKE_COMMAND) -P CMakeFiles/solver_structure_only.dir/cmake_clean.cmake
.PHONY : solvers/structure_only/CMakeFiles/solver_structure_only.dir/clean

solvers/structure_only/CMakeFiles/solver_structure_only.dir/depend:
	cd /home/zero/code/g2o/g2o/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zero/code/g2o/g2o /home/zero/code/g2o/g2o/solvers/structure_only /home/zero/code/g2o/g2o/build /home/zero/code/g2o/g2o/build/solvers/structure_only /home/zero/code/g2o/g2o/build/solvers/structure_only/CMakeFiles/solver_structure_only.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : solvers/structure_only/CMakeFiles/solver_structure_only.dir/depend
