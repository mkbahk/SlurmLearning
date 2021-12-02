#!/bin/bash
#SBATCH --job-name=Fashion-MNIST-pytorch-class-poplar-sdk2_3-tmp-00
#SBATCH --partition=v-ipu
#SBATCH -D .
#SBATCH --output=./Fashion-MNIST-pytorch-class-poplar-sdk2_3-tmp-00_%j.out
#SBATCH --error=./Fashion-MNIST-pytorch-class-poplar-sdk2_3-tmp-00_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --gres=vipu:pod64:2
#SBATCH --ipus=2
#SBATCH --num-replicas=1
#SBATCH --time=00:20:00
source ./venvpo230pop230/bin/activate
echo "============Job Start==============="
echo "=============Poplar Version==============="
popc --version
echo "=============PopART Version==============="
python3 -c "import popart;print(popart.__version__)"
echo "=============V-ipu Partition List==============="
vipu list partition
echo "=============GC-Monitor==============="
gc-monitor
echo "=============Fashion MNIST Learning Start==============="
python3 -c "import poptorch as pt;print(pt.__version__)"
python3 ./Fashion-MNIST-pytorch-class-poplar-sdk2_3.py
echo "=============deactivate==============="
deactivate
echo "=============Job Done==============="
