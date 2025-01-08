#!/bin/bash
# 1 GPU on 1 node
SIZE_MIN=8
SIZE_MAX=128M
NCCL_SOCKET_IFNAME=bond0.100 /home/jps/anaconda3/envs/nccl-tests/bin/mpirun \
-x NCCL_SOCKET_IFNAME --hostfile hosts -np 1 \
--mca oob_tcp_if_include bond0.100 --mca btl_tcp_if_include bond0.100 \
./build/all_reduce_perf -b $SIZE_MIN -e $SIZE_MAX -f 2 -g 1 -t 1 -d float -w 10 -n 10 -m 10 -a 1 -z 0 -G 0
# 4 GPUs on 1 node
NCCL_SOCKET_IFNAME=bond0.100 /home/jps/anaconda3/envs/nccl-tests/bin/mpirun \
-x NCCL_SOCKET_IFNAME --hostfile hosts -np 2 \
--mca oob_tcp_if_include bond0.100 --mca btl_tcp_if_include bond0.100 \
./build/all_reduce_perf -b $SIZE_MIN -e $SIZE_MAX -f 2 -g 1 -t 1 -d float -w 10 -n 10 -m 10 -a 1 -z 0 -G 0
# 4 GPUs on 1 node
NCCL_SOCKET_IFNAME=bond0.100 /home/jps/anaconda3/envs/nccl-tests/bin/mpirun \
-x NCCL_SOCKET_IFNAME --hostfile hosts -np 4 \
--mca oob_tcp_if_include bond0.100 --mca btl_tcp_if_include bond0.100 \
./build/all_reduce_perf -b $SIZE_MIN -e $SIZE_MAX -f 2 -g 1 -t 1 -d float -w 10 -n 10 -m 10 -a 1 -z 0 -G 0
# 2 GPUs on 2 nodes
NCCL_SOCKET_IFNAME=bond0.100 /home/jps/anaconda3/envs/nccl-tests/bin/mpirun \
-x NCCL_SOCKET_IFNAME --hostfile hosts -np 2 --map-by ppr:1:node \
--mca oob_tcp_if_include bond0.100 --mca btl_tcp_if_include bond0.100 \
./build/all_reduce_perf -b $SIZE_MIN -e $SIZE_MAX -f 2 -g 1 -t 1 -d float -w 10 -n 10 -m 10 -a 1 -z 0 -G 0
# 4 GPUs on 2 nodes
NCCL_SOCKET_IFNAME=bond0.100 /home/jps/anaconda3/envs/nccl-tests/bin/mpirun \
-x NCCL_SOCKET_IFNAME --hostfile hosts -np 4 --map-by ppr:2:node \
--mca oob_tcp_if_include bond0.100 --mca btl_tcp_if_include bond0.100 \
./build/all_reduce_perf -b $SIZE_MIN -e $SIZE_MAX -f 2 -g 1 -t 1 -d float -w 10 -n 10 -m 10 -a 1 -z 0 -G 0
# 8 GPUs on 2 nodes
NCCL_SOCKET_IFNAME=bond0.100 /home/jps/anaconda3/envs/nccl-tests/bin/mpirun \
-x NCCL_SOCKET_IFNAME --hostfile hosts -np 8 \
--mca oob_tcp_if_include bond0.100 --mca btl_tcp_if_include bond0.100 \
./build/all_reduce_perf -b $SIZE_MIN -e $SIZE_MAX -f 2 -g 1 -t 1 -d float -w 10 -n 10 -m 10 -a 1 -z 0 -G 0
