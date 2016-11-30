#编译提示CUDADIR value is not a directory: /opt/pgi/linux86-64/2015/cuda/7.0/bin
#需要在/opt/pgi/linux86-64/2015/下创建一个cuda,里面装着一个链接7.0，指向/usr/local/cuda-7.0的内容（bin，……）
mkdir /opt/pgi/linux86-64/2015/cuda
ln -s /usr/local/cuda-7.0 /opt/pgi/linux86-64/2015/cuda/7.0
