#!/bin/bash
#SBATCH --job-name=mnist-cnn-keras-functional-ipu-dist-sdk-22-tmp-01
#SBATCH --partition=v-ipu
#SBATCH -D .
#SBATCH --output=./mnist-cnn-keras-functional-ipu-dist-sdk-22-tmp-01_%j.out
#SBATCH --error=./mnist-cnn-keras-functional-ipu-dist-sdk-22-tmp-01_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --gres=vipu:pod64:2
#SBATCH --ipus=2
#SBATCH --num-replicas=1
#SBATCH --time=00:20:00
echo "============Job Start==============="
source ./venvpo230tf243/bin/activate
popc --version
python3 -c "import popart;print(popart.__version__)"
vipu list partition
gc-monitor
python3 -c "import tensorflow as tf;print(tf.__version__)"
python3 ./mnist-cnn-keras-functional-ipu-dist-sdk-2.2.py
deactivate
echo "=============Job Done==============="
