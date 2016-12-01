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
CMAKE_SOURCE_DIR = "/home/plz/slam/Untitled Folder/slam_cloud/slam_server"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/plz/slam/Untitled Folder/slam_cloud/slam_server/build"

# Include any dependencies generated for this target.
include src/CMakeFiles/server.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/server.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/server.dir/flags.make

src/CMakeFiles/server.dir/server_node.cpp.o: src/CMakeFiles/server.dir/flags.make
src/CMakeFiles/server.dir/server_node.cpp.o: ../src/server_node.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report "/home/plz/slam/Untitled Folder/slam_cloud/slam_server/build/CMakeFiles" $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/server.dir/server_node.cpp.o"
	cd "/home/plz/slam/Untitled Folder/slam_cloud/slam_server/build/src" && g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/server.dir/server_node.cpp.o -c "/home/plz/slam/Untitled Folder/slam_cloud/slam_server/src/server_node.cpp"

src/CMakeFiles/server.dir/server_node.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server.dir/server_node.cpp.i"
	cd "/home/plz/slam/Untitled Folder/slam_cloud/slam_server/build/src" && g++  $(CXX_DEFINES) $(CXX_FLAGS) -E "/home/plz/slam/Untitled Folder/slam_cloud/slam_server/src/server_node.cpp" > CMakeFiles/server.dir/server_node.cpp.i

src/CMakeFiles/server.dir/server_node.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server.dir/server_node.cpp.s"
	cd "/home/plz/slam/Untitled Folder/slam_cloud/slam_server/build/src" && g++  $(CXX_DEFINES) $(CXX_FLAGS) -S "/home/plz/slam/Untitled Folder/slam_cloud/slam_server/src/server_node.cpp" -o CMakeFiles/server.dir/server_node.cpp.s

src/CMakeFiles/server.dir/server_node.cpp.o.requires:
.PHONY : src/CMakeFiles/server.dir/server_node.cpp.o.requires

src/CMakeFiles/server.dir/server_node.cpp.o.provides: src/CMakeFiles/server.dir/server_node.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/server.dir/build.make src/CMakeFiles/server.dir/server_node.cpp.o.provides.build
.PHONY : src/CMakeFiles/server.dir/server_node.cpp.o.provides

src/CMakeFiles/server.dir/server_node.cpp.o.provides.build: src/CMakeFiles/server.dir/server_node.cpp.o

# Object files for target server
server_OBJECTS = \
"CMakeFiles/server.dir/server_node.cpp.o"

# External object files for target server
server_EXTERNAL_OBJECTS =

../bin/server: src/CMakeFiles/server.dir/server_node.cpp.o
../bin/server: src/CMakeFiles/server.dir/build.make
../bin/server: /usr/local/lib/libopencv_videostab.so.2.4.9
../bin/server: /usr/local/lib/libopencv_video.so.2.4.9
../bin/server: /usr/local/lib/libopencv_ts.a
../bin/server: /usr/local/lib/libopencv_superres.so.2.4.9
../bin/server: /usr/local/lib/libopencv_stitching.so.2.4.9
../bin/server: /usr/local/lib/libopencv_photo.so.2.4.9
../bin/server: /usr/local/lib/libopencv_ocl.so.2.4.9
../bin/server: /usr/local/lib/libopencv_objdetect.so.2.4.9
../bin/server: /usr/local/lib/libopencv_nonfree.so.2.4.9
../bin/server: /usr/local/lib/libopencv_ml.so.2.4.9
../bin/server: /usr/local/lib/libopencv_legacy.so.2.4.9
../bin/server: /usr/local/lib/libopencv_imgproc.so.2.4.9
../bin/server: /usr/local/lib/libopencv_highgui.so.2.4.9
../bin/server: /usr/local/lib/libopencv_gpu.so.2.4.9
../bin/server: /usr/local/lib/libopencv_flann.so.2.4.9
../bin/server: /usr/local/lib/libopencv_features2d.so.2.4.9
../bin/server: /usr/local/lib/libopencv_core.so.2.4.9
../bin/server: /usr/local/lib/libopencv_contrib.so.2.4.9
../bin/server: /usr/local/lib/libopencv_calib3d.so.2.4.9
../bin/server: /usr/lib/x86_64-linux-gnu/libGLU.so
../bin/server: /usr/lib/x86_64-linux-gnu/libGL.so
../bin/server: /usr/lib/x86_64-linux-gnu/libSM.so
../bin/server: /usr/lib/x86_64-linux-gnu/libICE.so
../bin/server: /usr/lib/x86_64-linux-gnu/libX11.so
../bin/server: /usr/lib/x86_64-linux-gnu/libXext.so
../bin/server: /usr/local/lib/libopencv_nonfree.so.2.4.9
../bin/server: /usr/local/lib/libopencv_ocl.so.2.4.9
../bin/server: /usr/local/lib/libopencv_gpu.so.2.4.9
../bin/server: /usr/local/lib/libopencv_photo.so.2.4.9
../bin/server: /usr/local/lib/libopencv_objdetect.so.2.4.9
../bin/server: /usr/local/lib/libopencv_legacy.so.2.4.9
../bin/server: /usr/local/lib/libopencv_video.so.2.4.9
../bin/server: /usr/local/lib/libopencv_ml.so.2.4.9
../bin/server: /usr/local/lib/libopencv_calib3d.so.2.4.9
../bin/server: /usr/local/lib/libopencv_features2d.so.2.4.9
../bin/server: /usr/local/lib/libopencv_highgui.so.2.4.9
../bin/server: /usr/local/lib/libopencv_imgproc.so.2.4.9
../bin/server: /usr/local/lib/libopencv_flann.so.2.4.9
../bin/server: /usr/local/lib/libopencv_core.so.2.4.9
../bin/server: src/CMakeFiles/server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../bin/server"
	cd "/home/plz/slam/Untitled Folder/slam_cloud/slam_server/build/src" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/server.dir/build: ../bin/server
.PHONY : src/CMakeFiles/server.dir/build

src/CMakeFiles/server.dir/requires: src/CMakeFiles/server.dir/server_node.cpp.o.requires
.PHONY : src/CMakeFiles/server.dir/requires

src/CMakeFiles/server.dir/clean:
	cd "/home/plz/slam/Untitled Folder/slam_cloud/slam_server/build/src" && $(CMAKE_COMMAND) -P CMakeFiles/server.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/server.dir/clean

src/CMakeFiles/server.dir/depend:
	cd "/home/plz/slam/Untitled Folder/slam_cloud/slam_server/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/plz/slam/Untitled Folder/slam_cloud/slam_server" "/home/plz/slam/Untitled Folder/slam_cloud/slam_server/src" "/home/plz/slam/Untitled Folder/slam_cloud/slam_server/build" "/home/plz/slam/Untitled Folder/slam_cloud/slam_server/build/src" "/home/plz/slam/Untitled Folder/slam_cloud/slam_server/build/src/CMakeFiles/server.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : src/CMakeFiles/server.dir/depend
