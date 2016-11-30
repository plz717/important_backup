#安装依赖
sudo apt-get -y install libeigen3-dev libsuitesparse-dev libqt4-dev qt4-qmake
cd /home/plz/Downloads/gx_slam/libqglviewer_for_ubuntu1404
sudo dpkg -i libqglviewer-dev-common_2.3.4-4ubuntu2_all.deb
sudo dpkg -i libqglviewer-qt4-2_2.3.4-4ubuntu2_amd64.deb
sudo dpkg -i libqglviewer-qt4-dev_2.3.4-4ubuntu2_amd64.deb
cd /home/plz/Downloads/gx_slam/g2o
mkdir build
cd build
cmake ..
make
sudo make install
#安装成功后，在/usr/local/include/g2o中找到它的头文件，而在/usr/local/lib中找到它的库文件
#执行二进制文件slamEnd之后
cd /home/plz/Downloads/gx_slam/6
#用g2o_viewer查看全局优化之后的结果
g2o_viewer data/result_after.g2o
