wget http://www.gutenberg.org/cache/epub/4300/pg4300.txt
wget http://www.gutenberg.org/files/5000/5000-8.txt
wget http://www.gutenberg.org/cache/epub/20417/pg20417.txt


cd /usr/local/hadoop/tmp
mkdir gutenberg
cp -i /home/plz/pg4300.txt ./gutenberg/
cp -i /home/plz/pg20417.txt ./gutenberg/
cp -i /home/plz/5000-8.txt ./gutenberg/
ls -l ./gutenberg/
cd ..

创建路径中的各级父目录

start-all.sh


/usr/local/hadoop$ hdfs dfs -mkdir -p /user/hduser
bin/hadoop dfs -copyFromLocal ./tmp/gutenberg/ /user/hduser/plz_test
!!!!bin/hadoop dfs -copyFromLocal /tmp/gutenberg/pg20417.txt /user/hduser/gutenberg

cd /usr/local/hadoop
start-all.sh
bin/hadoop fs -ls /user/hadoop/gutenberg
 
bin/hadoop jar share/hadoop/mapreduce/sources/hadoop-mapreduce-examples-2.7.2-sources.jar org.apache.hadoop.examples.WordCount /user/hduser/gutenberg /user/hduser/gutenberg-output
#修改reducer个数，采用-D选项
#重新运行时一定要新建一个output文件或者将原来的删掉
bin/hadoop jar share/hadoop/mapreduce/sources/hadoop-mapreduce-examples-2.7.2-sources.jar org.apache.hadoop.examples.WordCount -D mapred.reduce.tasks=16 /user/hduser/gutenberg /user/hduser/gutenberg-output1
#输出结果
bin/hadoop dfs -cat /user/hduser/gutenberg-output1/part-r-00000
#download file from HDFS to local 
#到本地时文件名不变
sudo bin/hadoop fs -get /user/hduser/gutenberg-output1/part-r-00000 /home/
#也可以到本地时改变文件名为hdfile
sudo bin/hadoop fs -get /user/hduser/gutenberg-output1/part-r-00000 /home/hdfile
#将hdfs中/user/hduser/gutenberg-output1文件夹下的所有文件合并连接成本地目标文件，gutenberg-output1为自定义本地文件名
sudo bin/hadoop fs -getmerge /user/hduser/gutenberg-output1 /home/gutenberg-output1
