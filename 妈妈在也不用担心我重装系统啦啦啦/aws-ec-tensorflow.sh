sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y build-essential git python-pip libfreetype6-dev libxft-dev libncurses-dev libopenblas-dev gfortran python-matplotlib libblas-dev liblapack-dev libatlas-base-dev python-dev python-pydot linux-headers-generic linux-image-extra-virtual unzip python-numpy swig python-pandas python-sklearn unzip wget pkg-config zip g++ zlib1g-dev
sudo pip install -U pip
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo apt-get update
sudo apt-get install cuda
sudo apt-get -f install

#download cuDNN from Nvidia’s site.!!!
wget https://github.com/the0demiurge/python-test/raw/master/cudnn-7.0-linux-x64-v4.0-prod.tgz
tar -zxf cudnn-7.0-linux-x64-v4.0-prod.tgz
sudo cp -R cuda/lib64/ /usr/local/cuda/lib64/
cd cuda/include/
sudo cp cudnn.h /usr/local/cuda/include/
sudo reboot

#add some environment variables
sudo apt-get install nano
sudo nano ~/.bashrc
#写入：
export CUDA_HOME=/usr/local/cuda
export CUDA_ROOT=/usr/local/cuda
export PATH=$PATH:$CUDA_ROOT/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_ROOT/lib64

#install java-8
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
# Hack to silently agree license agreement
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer

#install bazel
sudo apt-get install pkg-config zip g++ zlib1g-dev
#wget https://github.com/bazelbuild/bazel/releases/download/0.1.4/bazel-0.1.4-installer-linux-x86_64.sh
wget https://github.com/bazelbuild/bazel/releases/download/0.3.2/bazel-0.3.2-installer-linux-x86_64.sh
chmod +x bazel-0.1.4-installer-linux-x86_64.sh
./bazel-0.1.4-installer-linux-x86_64.sh --user
#add /home/ubuntu/bin to my PATH

#clone tensorflow
git clone --recurse-submodules https://github.com/tensorflow/tensorflow
cd tensorflow
sudo TF_UNOFFICIAL_SETTING=1 ./configure



