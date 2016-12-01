# Install script for directory: /home/zero/code/g2o/g2o/types/slam3d

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/libtypes_slam3d.a")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/usr/local/lib" TYPE STATIC_LIBRARY FILES "/home/zero/code/g2o/g2o/build/types/slam3d/libtypes_slam3d.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/g2o/types/slam3d/edge_se3_prior.h;/usr/local/include/g2o/types/slam3d/edge_se3_offset.h;/usr/local/include/g2o/types/slam3d/edge_se3.h;/usr/local/include/g2o/types/slam3d/dquat2mat.h;/usr/local/include/g2o/types/slam3d/edge_se3_pointxyz.h;/usr/local/include/g2o/types/slam3d/se3_ops.h;/usr/local/include/g2o/types/slam3d/parameter_stereo_camera.h;/usr/local/include/g2o/types/slam3d/types_slam3d.h;/usr/local/include/g2o/types/slam3d/parameter_se3_offset.h;/usr/local/include/g2o/types/slam3d/g2o_types_slam3d_api.h;/usr/local/include/g2o/types/slam3d/edge_se3_pointxyz_depth.h;/usr/local/include/g2o/types/slam3d/isometry3d_gradients.h;/usr/local/include/g2o/types/slam3d/isometry3d_mappings.h;/usr/local/include/g2o/types/slam3d/parameter_camera.h;/usr/local/include/g2o/types/slam3d/vertex_pointxyz.h;/usr/local/include/g2o/types/slam3d/edge_se3_pointxyz_disparity.h;/usr/local/include/g2o/types/slam3d/se3quat.h;/usr/local/include/g2o/types/slam3d/vertex_se3.h;/usr/local/include/g2o/types/slam3d/se3_ops.hpp")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/usr/local/include/g2o/types/slam3d" TYPE FILE FILES
    "/home/zero/code/g2o/g2o/types/slam3d/edge_se3_prior.h"
    "/home/zero/code/g2o/g2o/types/slam3d/edge_se3_offset.h"
    "/home/zero/code/g2o/g2o/types/slam3d/edge_se3.h"
    "/home/zero/code/g2o/g2o/types/slam3d/dquat2mat.h"
    "/home/zero/code/g2o/g2o/types/slam3d/edge_se3_pointxyz.h"
    "/home/zero/code/g2o/g2o/types/slam3d/se3_ops.h"
    "/home/zero/code/g2o/g2o/types/slam3d/parameter_stereo_camera.h"
    "/home/zero/code/g2o/g2o/types/slam3d/types_slam3d.h"
    "/home/zero/code/g2o/g2o/types/slam3d/parameter_se3_offset.h"
    "/home/zero/code/g2o/g2o/types/slam3d/g2o_types_slam3d_api.h"
    "/home/zero/code/g2o/g2o/types/slam3d/edge_se3_pointxyz_depth.h"
    "/home/zero/code/g2o/g2o/types/slam3d/isometry3d_gradients.h"
    "/home/zero/code/g2o/g2o/types/slam3d/isometry3d_mappings.h"
    "/home/zero/code/g2o/g2o/types/slam3d/parameter_camera.h"
    "/home/zero/code/g2o/g2o/types/slam3d/vertex_pointxyz.h"
    "/home/zero/code/g2o/g2o/types/slam3d/edge_se3_pointxyz_disparity.h"
    "/home/zero/code/g2o/g2o/types/slam3d/se3quat.h"
    "/home/zero/code/g2o/g2o/types/slam3d/vertex_se3.h"
    "/home/zero/code/g2o/g2o/types/slam3d/se3_ops.hpp"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

