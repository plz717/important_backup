# on ps
python mnist_replica.py \
     --ps_hosts=localhost:2222 \
     --worker_hosts=localhost:2223,localhost:2224,localhost:2225,localhost:2226\
     --job_name=ps --task_index=0
     
# on worker1
python mnist_replica.py \
     --ps_hosts=localhost:2222 \
     --worker_hosts=localhost:2223,localhost:2224,localhost:2225,localhost:2226\
     --job_name=worker --task_index=0
     
# on worker2
python mnist_replica.py \
     --ps_hosts=localhost:2222 \
     --worker_hosts=localhost:2223,localhost:2224,localhost:2225,localhost:2226\
     --job_name=worker --task_index=1
     
# on worker3
python mnist_replica.py \
     --ps_hosts=localhost:2222 \
     --worker_hosts=localhost:2223,localhost:2224,localhost:2225,localhost:2226\
     --job_name=worker --task_index=2
     
     
# on worker4
python mnist_replica.py \
     --ps_hosts=localhost:2222 \
     --worker_hosts=localhost:2223,localhost:2224,localhost:2225,localhost:2226\
     --job_name=worker --task_index=3