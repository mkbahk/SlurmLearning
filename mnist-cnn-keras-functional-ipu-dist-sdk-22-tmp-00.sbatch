#!/bin/bash
#SBATCH --job-name=mnist-cnn-keras-functional-ipu-dist-sdk-22-tmp-00
#SBATCH --partition=v-ipu
#SBATCH -D .
#SBATCH --output=./mnist-cnn-keras-functional-ipu-dist-sdk-22-tmp-00_%j.out
#SBATCH --error=./mnist-cnn-keras-functional-ipu-dist-sdk-22-tmp-00_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --gres=vipu:pod64:2
#SBATCH --ipus=2
#SBATCH --num-replicas=1
#SBATCH --time=00:20:00
source ./venvpo230tf243/bin/activate
echo "============Job Start==============="
echo "=============Poplar Version==============="
popc --version
echo "=============PopART Version==============="
python3 -c "import popart;print(popart.__version__)"
echo "=============V-ipu Partition List==============="
vipu list partition
echo "=============GC-Monitor==============="
gc-monitor
echo "=============MNIST Learning Start==============="
python3 -c "import tensorflow as tf;print(tf.__version__)"
python3 ./mnist-cnn-keras-functional-ipu-dist-sdk-2.2.py
echo "=============deactivate==============="
deactivate
echo "=============Job Done==============="
