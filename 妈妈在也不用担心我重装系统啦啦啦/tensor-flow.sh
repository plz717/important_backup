#首先安装CUDA7.5
#然后安装cuDNN v4：下载cudnn-7.0-linux-x64-v4.0-prod.tgz
cd ~/Downloads
tar xvzf cudnn-7.0-linux-x64-v4.0-prod.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
#选择Virtualenv install方式
#install pip and virtualenv
# Ubuntu/Linux 64-bit
sudo apt-get install python-pip python-dev python-virtualenv
#Create a Virtualenv environment in the directory ~/tensorflow:
virtualenv --system-site-packages ~/tensorflow
#Activate the environment:
source ~/tensorflow/bin/activate  # If using bash
#(tensorflow)$  # Your prompt should change
#install tensor flow:
# Ubuntu/Linux 64-bit, GPU enabled, Python 2.7
# Requires CUDA toolkit 7.5 and CuDNN v4. For other versions, see "Install from sources" below.
#(tensorflow)$ 
export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.10.0rc0-cp27-none-linux_x86_64.whl
# Python 2
pip install --upgrade $TF_BINARY_URL
#在～/.bashrc中设置环境变量
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"
#export CUDA_HOME=/usr/local/cuda
#deactivate the environment：(tensorflow)$ 
deactivate
