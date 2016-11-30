cd 2016_1_6
cd xiazai
cd LSB
sudo dpkg -i lsb-base_4.1+Debian11ubuntu6.1_all.deb
sudo dpkg -i lsb-invalid-mta_4.1+Debian11ubuntu6.1_all.deb
sudo dpkg -i lsb-security_4.1+Debian11ubuntu6.1_amd64.deb
sudo dpkg -i lsb-release_4.1+Debian11ubuntu6.1_all.deb
sudo dpkg -i lsb-core_4.1+Debian11ubuntu6.1_amd64.deb
sudo apt-get install at
sudo apt-get -f install
sudo dpkg -i lsb-core_4.1+Debian11ubuntu6.1_amd64.deb
sudo dpkg -i lsb-graphics_4.1+Debian11ubuntu6.1_amd64.deb
sudo dpkg -i lsb-multimedia_4.1+Debian11ubuntu6.1_amd64.deb
sudo dpkg -i lsb-desktop_4.1+Debian11ubuntu6.1_amd64.deb
sudo apt-get install libpod-plainer-perl
sudo apt-get -f install
sudo dpkg -i lsb-desktop_4.1+Debian11ubuntu6.1_amd64.deb
sudo dpkg -i lsb-languages_4.1+Debian11ubuntu6.1_amd64.deb 
sudo dpkg -i lsb-cxx_4.1+Debian11ubuntu6.1_amd64.deb
sudo dpkg -i lsb_4.1+Debian11ubuntu6.1_all.deb
sudo dpkg -i lsb-cxx_4.1+Debian11ubuntu6.1_amd64.deb 
#把编译过程中需要用到的软件包先配置好
sudo apt-get build-dep adduser -y
#解压源码包.tar.xz
xz -d lsb_4.1+Debian11ubuntu6.1.tar.xz
tar xvf lsb_4.1+Debian11ubuntu6.1.tar
#编译源码包
cd lsb-4.1+Debian11ubuntu6
dpkg-buildpackage -rfakeroot -uc -b
sudo apt-get -y install python-all-dev
sudo apt-get -y install python3-all-dev
dpkg-buildpackage -rfakeroot -uc -b
