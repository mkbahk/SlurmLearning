#!/bin/bash
#SBATCH --job-name=mnist-cnn-keras-functional-ipu-dist-00
#SBATCH --partition=v-ipu
#SBATCH -D .
#SBATCH --output=./mnist-cnn-keras-functional-ipu-dist-00_%j.out
#SBATCH --error=./mnist-cnn-keras-functional-ipu-dist_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --gres=vipu:pod64:2
#SBATCH --ipus=2
#SBATCH --num-replicas=1
#SBATCH --time=00:20:00
echo "============Job Starting==============="
python3 -m venv ./venvp23tf24-11
source ./venvp23tf24-11/bin/activate
pip3 install -U pip
pip3 install ./poplar_sdk-ubuntu_18_04-2.3.0+774-b47c577c2a/tensorflow-2.4.3+gc2.3.0+106852+76e1bca4681+amd_znver1-cp36-cp36m-linux_x86_64.whl
python3 ./mnist-cnn-keras-functional-ipu-dist-sdk-2.2.py
deactivate
echo "=============Job Done & removing python venv==============="
rm -rf ./venvp23tf24-11
echo "===========All of Jobs Completed==========="
