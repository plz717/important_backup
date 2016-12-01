import tensorflow as tf
 
worker1="219.216.87.181:2222"
worker2="172.31.28.131:2223"
 
worker_hosts=[worker1,worker2]
cluster_spec=tf.train.ClusterSpec({"worker":worker_hosts})
 
server=tf.train.Server(cluster_spec,job_name="worker",task_index=0)
server.join()
