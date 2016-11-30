cat /proc/driver/nvidia/version 
nvcc -V
cat /var/lib/apt/lists/*cuda*Packages | grep "Package:"
cd /home/plz
mkdir cuda-samples
cd /usr/local/cuda-7.0/bin
sudo chmod +x cuda-install-samples-7.0.sh 
./cuda-install-samples-7.0.sh /home/plz/cuda-samples
cd /home/plz/cuda-samples/NVIDIA_CUDA-7.0_Samples 
make 
sudo reboot
sudo apt-get -y install nvidia-opencl-icd-352
sudo apt-get -y install cuda-drivers
sudo reboot
sudo apt-get -y install selinux-utils
setenforce 0
sudo reboot
cd cuda-samples
cd NVIDIA_CUDA-7.0_Samples/
cd bin
cd x86_64
cd linux
cd release
./deviceQuery
./bandwidthTest

