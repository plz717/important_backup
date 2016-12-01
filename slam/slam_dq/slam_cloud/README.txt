slam_client为本地文件夹
功能：读取视频数据，提取关键帧，将关键帧发送到slam_server

slam_g2o是云端文件夹
功能：一直保持着接收数据的状态，一旦接收到server发送的数据，就执行全局优化，

slam_server是云端文件夹
功能：一直保持着接受关键帧的状态，一旦client提取到一帧关键帧，就将其读取到数据库（这里用data文件夹模拟数据库）

使用：
首先将三个文件夹分别编译好：进入各自的build文件夹中，
cd build
cmake ..
make
然后，首先启动slam_g2o进程:
进入slam_g2o文件夹中的bin文件夹，执行： ./g2o 那么这个进程就一直等着接数据拉
然后启动slam_client进程：同上。然后这一进程就不断的读数据，提取关键帧了～
最后执行slam_server：同上，一旦client提取到关键帧，server就将关键帧读取到data文件夹中

最后会在slam_g2o/data下看到result.pcd文件，这是构建好的地图，显示方式：
cd slam_g2o/data
pcl_viewer ./result.pcd
