#首先下载jdk-8u91-linux-x64.tar.gz文件
cd /opt
sudo cp ~/Downloads/jdk-8u91-linux-x64.tar.gz -i /opt/
sudo tar zxvf jdk-8u91-linux-x64.tar.gz
sudo rm -r jdk-8u91-linux-x64.tar.gz
#The full JDK which will be placed in /usr/lib/jvm/java-6-sun
#check whether JDK is correctly set up
java -version
#add a hadoop group and a user
sudo addgroup hadoop
sudo adduser --ingroup hadoop hadoop_plz
#给hadoop_plz增加管理员权限
sudo gedit /etc/sudoers
#在root  ALL=(ALL:ALL)  ALL下添加hadoop_plz  ALL=(ALL:ALL) ALL
#配置ssh，以使各机器之间执行指令无需输入登录密码，否则，主节点每次试图访问其他节点时，都需要手动输入这个密码。
#su - hduser 切换到hduser下
#安装ssh
sudo apt-get install openssh-server
sudo /etc/init.d/ssh start
ps -e |grep ssh
ssh-keygen -y -t rsa -P ""
cat ~/.ssh/id_rsa.pub>> ~/.ssh/authorized_keys
ssh localhost
exit
sudo tar xzf hadoop-2.7.2.tar.gz
sudo mv hadoop-2.7.2 /usr/local/hadoop
sudo chown -R hduser:hadoop /usr/local/hadoop
#配置~/.bashrc
#查看java安装路径
update-alternatives --config java   
sudo gedit ~/.bashrc
#在文件末尾追加下面内容
#HADOOP VARIABLES START
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export HADOOP_INSTALL=/usr/local/hadoop
export PATH=$PATH:$HADOOP_INSTALL/bin
export PATH=$PATH:$HADOOP_INSTALL/sbin
export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
export HADOOP_COMMON_HOME=$HADOOP_INSTALL
export HADOOP_HDFS_HOME=$HADOOP_INSTALL
export YARN_HOME=$HADOOP_INSTALL
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_INSTALL/lib"
#HADOOP VARIABLES END
source ~/.bashrc
sudo gedit /usr/local/hadoop/etc/hadoop/hadoop-env.sh
#找到JAVA_HOME变量，修改此变量如下
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
#至此，单机模式安装完毕，下面进行wordcount测试
cd /usr/local/hadoop/
mkdir input
sudo cp README.txt input
#每次重新执行wordcount程序的时候，都需要先把output文件夹删除
bin/hadoop jar share/hadoop/mapreduce/sources/hadoop-mapreduce-examples-2.7.2-sources.jar org.apache.hadoop.examples.WordCount input output
#查看字符统计结果
cat output/*
#下面是伪分布模式的配置
cd /usr/local/hadoop
mkdir tmp
mkdir tmp/dfs
mkdir tmp/dfs/data
mkdir tmp/dfs/name
#修改配置文件 core-site.xml
sudo gedit etc/hadoop/core-site.xml
#修改为以下配置：
<configuration>
        <property>
             <name>hadoop.tmp.dir</name>
             <value>file:/usr/local/hadoop/tmp</value>
             <description>Abase for other temporary directories.</description>
        </property>
        <property>
             <name>fs.defaultFS</name>
             <value>hdfs://localhost:9000</value>
        </property>
</configuration>
#修改hdfs-site.xml
<configuration>
        <property>
             <name>dfs.replication</name>
             <value>1</value>
        </property>
        <property>
             <name>dfs.namenode.name.dir</name>
             <value>file:/usr/local/hadoop/tmp/dfs/name</value>
        </property>
        <property>
             <name>dfs.datanode.data.dir</name>
             <value>file:/usr/local/hadoop/tmp/dfs/data</value>
        </property>
</configuration>
#执行NameNode 的格式化
./bin/hdfs namenode -format
./sbin/start-yarn.sh
sudo gedit etc/hadoop/hadoop-env.sh
#加上export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop
source etc/hadoop/hadoop-env.sh
./sbin/start-dfs.sh

