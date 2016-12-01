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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/plz/slam/slam_dq2/slam_cloud/slam_client

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/plz/slam/slam_dq2/slam_cloud/slam_client/build

# Include any dependencies generated for this target.
include src/CMakeFiles/main.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/main.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/main.dir/flags.make

src/CMakeFiles/main.dir/main.o: src/CMakeFiles/main.dir/flags.make
src/CMakeFiles/main.dir/main.o: ../src/main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/plz/slam/slam_dq2/slam_cloud/slam_client/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/main.dir/main.o"
	cd /home/plz/slam/slam_dq2/slam_cloud/slam_client/build/src && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/main.o -c /home/plz/slam/slam_dq2/slam_cloud/slam_client/src/main.cpp

src/CMakeFiles/main.dir/main.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/main.i"
	cd /home/plz/slam/slam_dq2/slam_cloud/slam_client/build/src && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/plz/slam/slam_dq2/slam_cloud/slam_client/src/main.cpp > CMakeFiles/main.dir/main.i

src/CMakeFiles/main.dir/main.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/main.s"
	cd /home/plz/slam/slam_dq2/slam_cloud/slam_client/build/src && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/plz/slam/slam_dq2/slam_cloud/slam_client/src/main.cpp -o CMakeFiles/main.dir/main.s

src/CMakeFiles/main.dir/main.o.requires:
.PHONY : src/CMakeFiles/main.dir/main.o.requires

src/CMakeFiles/main.dir/main.o.provides: src/CMakeFiles/main.dir/main.o.requires
	$(MAKE) -f src/CMakeFiles/main.dir/build.make src/CMakeFiles/main.dir/main.o.provides.build
.PHONY : src/CMakeFiles/main.dir/main.o.provides

src/CMakeFiles/main.dir/main.o.provides.build: src/CMakeFiles/main.dir/main.o

# Object files for target main
main_OBJECTS = \
"CMakeFiles/main.dir/main.o"

# External object files for target main
main_EXTERNAL_OBJECTS =

../bin/main: src/CMakeFiles/main.dir/main.o
../bin/main: src/CMakeFiles/main.dir/build.make
../bin/main: ../lib/libslambase.a
../bin/main: /usr/local/lib/libopencv_videostab.so.2.4.9
../bin/main: /usr/local/lib/libopencv_video.so.2.4.9
../bin/main: /usr/local/lib/libopencv_ts.a
../bin/main: /usr/local/lib/libopencv_superres.so.2.4.9
../bin/main: /usr/local/lib/libopencv_stitching.so.2.4.9
../bin/main: /usr/local/lib/libopencv_photo.so.2.4.9
../bin/main: /usr/local/lib/libopencv_ocl.so.2.4.9
../bin/main: /usr/local/lib/libopencv_objdetect.so.2.4.9
../bin/main: /usr/local/lib/libopencv_nonfree.so.2.4.9
../bin/main: /usr/local/lib/libopencv_ml.so.2.4.9
../bin/main: /usr/local/lib/libopencv_legacy.so.2.4.9
../bin/main: /usr/local/lib/libopencv_imgproc.so.2.4.9
../bin/main: /usr/local/lib/libopencv_highgui.so.2.4.9
../bin/main: /usr/local/lib/libopencv_gpu.so.2.4.9
../bin/main: /usr/local/lib/libopencv_flann.so.2.4.9
../bin/main: /usr/local/lib/libopencv_features2d.so.2.4.9
../bin/main: /usr/local/lib/libopencv_core.so.2.4.9
../bin/main: /usr/local/lib/libopencv_contrib.so.2.4.9
../bin/main: /usr/local/lib/libopencv_calib3d.so.2.4.9
../bin/main: /usr/lib/x86_64-linux-gnu/libGLU.so
../bin/main: /usr/lib/x86_64-linux-gnu/libGL.so
../bin/main: /usr/lib/x86_64-linux-gnu/libSM.so
../bin/main: /usr/lib/x86_64-linux-gnu/libICE.so
../bin/main: /usr/lib/x86_64-linux-gnu/libX11.so
../bin/main: /usr/lib/x86_64-linux-gnu/libXext.so
../bin/main: /usr/local/lib/libopencv_nonfree.so.2.4.9
../bin/main: /usr/local/lib/libopencv_ocl.so.2.4.9
../bin/main: /usr/local/lib/libopencv_gpu.so.2.4.9
../bin/main: /usr/local/lib/libopencv_photo.so.2.4.9
../bin/main: /usr/local/lib/libopencv_objdetect.so.2.4.9
../bin/main: /usr/local/lib/libopencv_legacy.so.2.4.9
../bin/main: /usr/local/lib/libopencv_video.so.2.4.9
../bin/main: /usr/local/lib/libopencv_ml.so.2.4.9
../bin/main: /usr/local/lib/libopencv_calib3d.so.2.4.9
../bin/main: /usr/local/lib/libopencv_features2d.so.2.4.9
../bin/main: /usr/local/lib/libopencv_highgui.so.2.4.9
../bin/main: /usr/local/lib/libopencv_imgproc.so.2.4.9
../bin/main: /usr/local/lib/libopencv_flann.so.2.4.9
../bin/main: /usr/local/lib/libopencv_core.so.2.4.9
../bin/main: src/CMakeFiles/main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../bin/main"
	cd /home/plz/slam/slam_dq2/slam_cloud/slam_client/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/main.dir/build: ../bin/main
.PHONY : src/CMakeFiles/main.dir/build

src/CMakeFiles/main.dir/requires: src/CMakeFiles/main.dir/main.o.requires
.PHONY : src/CMakeFiles/main.dir/requires

src/CMakeFiles/main.dir/clean:
	cd /home/plz/slam/slam_dq2/slam_cloud/slam_client/build/src && $(CMAKE_COMMAND) -P CMakeFiles/main.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/main.dir/clean

src/CMakeFiles/main.dir/depend:
	cd /home/plz/slam/slam_dq2/slam_cloud/slam_client/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/plz/slam/slam_dq2/slam_cloud/slam_client /home/plz/slam/slam_dq2/slam_cloud/slam_client/src /home/plz/slam/slam_dq2/slam_cloud/slam_client/build /home/plz/slam/slam_dq2/slam_cloud/slam_client/build/src /home/plz/slam/slam_dq2/slam_cloud/slam_client/build/src/CMakeFiles/main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/main.dir/depend

