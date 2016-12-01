# ��~^�~J| PCL��~S�~Z~D��~]��~V
FIND_PACKAGE( PCL REQUIRED COMPONENTS common io visualization filters )

# ��~^�~J| opencv�~Z~D��~]��~V
FIND_PACKAGE( OpenCV REQUIRED )

# 添�~J| 头�~V~G件�~R~L��~S�~V~G件
ADD_DEFINITIONS( ${PCL_DEFINITIONS} )
INCLUDE_DIRECTORIES( ${PCL_INCLUDE_DIRS}  )
LINK_LIBRARIES( ${PCL_LIBRARY_DIRS} )

# 添�~J| g2o�~Z~D��~]��~V
# �~[| 为g2o��~M�~X�常�~T���~S��~L��~A添�~J| ��~C�~Z~Dfindg2o.cmake�~V~G件
LIST( APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules )
SET( G2O_ROOT /usr/local/include/g2o )
FIND_PACKAGE( G2O )
# CSparse
FIND_PACKAGE( CSparse )
INCLUDE_DIRECTORIES( ${G2O_INCLUDE_DIR} ${CSPARSE_INCLUDE_DIR} )


ADD_LIBRARY( slambase slamBase.cpp )
TARGET_LINK_LIBRARIES( slambase
    ${OpenCV_LIBS} 
    ${PCL_LIBRARIES} )

ADD_EXECUTABLE( slam slam_node.cpp )
TARGET_LINK_LIBRARIES( slam
    slambase
    ${OpenCV_LIBS}
    ${PCL_LIBRARIES}
    g2o_core g2o_types_slam3d g2o_solver_csparse g2o_stuff g2o_csparse_extension ${CSPARSE_LIBRARY})

