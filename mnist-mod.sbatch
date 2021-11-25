#!/bin/bash
#SBATCH --job-name=mnist-cnn-keras-functional-ipu-dist-00
#SBATCH --partition=v-ipu
#SBATCH -D .
#SBATCH --output=/mnt/nfs_slurm/slurm/mnist-cnn-keras-functional-ipu-dist-00_%j.out
#SBATCH --error=/mnt/nfs_slurm/slurm/mnist-cnn-keras-functional-ipu-dist_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --gres=vipu:pod64:2
#SBATCH --ipus=2
#SBATCH --num-replicas=1
#SBATCH --time=00:20:00
export TF_POPLAR_FLAGS=--executable_cache_path=/tmp
export TMPDIR=/tmp
vipu-admin list partitions
python3 -m venv /mnt/nfs_slurm/slurm/graphcore-test
source /mnt/nfs_slurm/slurm/graphcore-test/bin/activate
source /mnt/nfs_slurm/slurm/poplar_sdk-ubuntu_18_04-2.3.0+774-b47c577c2a/poplar-ubuntu_18_04-2.3.0+1367-88f485e763/enable.sh
source /mnt/nfs_slurm/slurm/poplar_sdk-ubuntu_18_04-2.3.0+774-b47c577c2a/popart-ubuntu_18_04-2.3.0+1367-88f485e763/enable.sh
python3 -m pip install -U pip
python3 -m pip install /mnt/nfs_slurm/slurm/poplar_sdk-ubuntu_18_04-2.3.0+774-b47c577c2a/tensorflow-2.4.3+gc2.3.0+106852+76e1bca4681+amd_znver1-cp36-cp36m-linux_x86_64.whl
echo "============Job Start==============="
#module load tensorflow/2.4.3 numpy/1.19.5
python3 /mnt/nfs_slurm/slurm/mnist-cnn-keras-functional-ipu-dist-sdk-2.2.py
deactivate
echo "=============Job Done==============="
rm -rf /mnt/nfs_slurm/slurm/graphcore-test
echo "===========All of Jobs Completed==========="
