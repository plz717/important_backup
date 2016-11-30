# Credits:
# These installation steps are based on Erik Bern’s tensorflow installation gist (https://gist.github.com/erikbern/78ba519b97b440e10640)
# with a couple of changes as I ran into some errors due to some recent changes in TensorFlow
# I've installed cudNN 7.0 (v4) instead of cudNN 6.5 (v4). Also, a newer version of Bazel was used 

# Please note that this is not a shell script. Some steps require you to reboot, plus you'd be prompted at a lot of places 

# First you need to have an ec2 instance up and running
# Select a g2.2xlarge instance with Ubuntu 14.04
# Configure 30GB of storage (I went with Magnetic since its cheap) 
# Configure Security Group | Allow incoming SSH (Port 22), HTTP (Port 80), HTTPS (443), Custom TCP for Jupyter (Port 8888)
# Launch the instance
# SSH into the instance
ssh -i key.pem ubuntu@ip

# Install pre-reqs
sudo apt-get update
sudo apt-get upgrade -y # choose “install package maintainers version”
sudo apt-get install -y build-essential python-pip python-dev git python-numpy swig python-dev default-jdk zip zlib1g-dev

# Blacklist Noveau which has some kind of conflict with the nvidia driver
echo -e "blacklist nouveau\nblacklist lbm-nouveau\noptions nouveau modeset=0\nalias nouveau off\nalias lbm-nouveau off\n" | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
echo options nouveau modeset=0 | sudo tee -a /etc/modprobe.d/nouveau-kms.conf
sudo update-initramfs -u
sudo reboot 

sudo apt-get install -y linux-image-extra-virtual
sudo reboot
sudo apt-get install -y linux-source linux-headers-`uname -r` 

# Install CUDA 7.0 
wget http://developer.download.nvidia.com/compute/cuda/7_0/Prod/local_installers/cuda_7.0.28_linux.run
chmod +x cuda_7.0.28_linux.run
./cuda_7.0.28_linux.run -extract=`pwd`/nvidia_installers
cd nvidia_installers
sudo ./NVIDIA-Linux-x86_64-346.46.run 
sudo modprobe nvidia
# You will be prompted for different options, go with default.
sudo ./cuda-linux64-rel-7.0.28-19326674.run 
cd

# Install CUDNN 7.0 v4
# You need to register at NVIDIA's site to download so SCP it here once you've downloaded it
#download cuDNN from Nvidia’s site.!!!
wget https://github.com/the0demiurge/python-test/raw/master/cudnn-7.0-linux-x64-v4.0-prod.tgz
tar -xzf cudnn-7.0-linux-x64-v4.0-prod.tgz
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo cp cuda/include/cudnn.h /usr/local/cuda/include/

# Add the following environment variables to your ~/.bashrc
export CUDA_HOME=/usr/local/cuda
export CUDA_ROOT=/usr/local/cuda
export PATH=$PATH:$CUDA_ROOT/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_ROOT/lib64

# Source the ~/.bashrc file
source ~/.bashrc

# Install Bazel (Instructions copied from the Bazel installation guide: http://www.bazel.io/docs/install.html)
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
echo "deb http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://storage.googleapis.com/bazel-apt/doc/apt-key.pub.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install bazel
#pgrade to newer version of Bazel with:
sudo apt-get upgrade bazel

# Let's setup tensorflow from source
git clone --recurse-submodules https://github.com/tensorflow/tensorflow
cd tensorflow

# Run ./configure like below to support K520 devices on AWS
# Accept Defaults except when: 
#             Asked for GPU support: enter Y
#             Asked for Cudnn version: enter 4
#             Asked for Compute Capability, enter 3.0
TF_UNOFFICIAL_SETTING=1 ./configure

# Build the target with GPU support (would take around 30 minutes)
bazel build -c opt --config=cuda //tensorflow/cc:tutorials_example_trainer 

# Creating the pip package and install
bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
sudo pip install /tmp/tensorflow_pkg/tensorflow-0.9.0-cp27-none-linux_x86_64.whl

# Test
cd tensorflow/models/image/cifar10/
python cifar10_multi_gpu_train.py
