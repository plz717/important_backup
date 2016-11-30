#!/bin/sh
sudo apt-get -y install okular
sudo apt-get -y install chromium-browser
wget https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-beta-64-bit.deb
dpkg -i lantern-installer-beta-64-bit.deb
rm -f lantern-installer-beta-64-bit.deb
./opencv.sh
lspci | grep -i nvidia
uname -m && cat /etc/*release
gcc --version
sudo apt-get update
sudo apt-get -y install nvidia-cuda-toolkit
sudo echo 'export PATH=/usr/local/cuda-7.0/bin:$PATH 
export LD_LIBRARY_PATH=/usr/local/cuda-7.0/64:$LD_LIBRARY_PATH' >> /etc/profile
sudo reboot

