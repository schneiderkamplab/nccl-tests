#!/bin/bash
conda create -n nccl-tests
conda activate nccl-tests
conda install nvidia::cuda-cudart nvidia::cuda-nvcc conda-forge::nccl conda-forge::openmpi-mpicc
ENV_PATH=$(conda info --envs | grep '*' | awk '{print $3;}')
export MPI=1
export CUDA_HOME=$ENV_PATH
export NCCL_HOME=$ENV_PATH
make

