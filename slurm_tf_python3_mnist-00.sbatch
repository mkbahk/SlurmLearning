#!/bin/bash
#SBATCH --job-name=slurm_tf_python3_mnist-00
#SBATCH --partition=v-ipu
#SBATCH -D .
#SBATCH --output=/mnt/nfs_slurm/slurm/slurm_tf_python3_mnist-00-output_%j.out
#SBATCH --error=/mnt/nfs_slurm/slurm/slurm_tf_python3_mnist-00-error_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --time=00:20:00
echo "===Createing Python Virtual Env======="
python3 -m venv /mnt/nfs_slurm/slurm/venvtf241-00
echo "===Openning Python Virtual Env======="
source /mnt/nfs_slurm/slurm/venvtf241-00/bin/activate
echo "===pip3 update======="
pip3 install -U pip
echo "===tensorflow 2.4 1 install======="
pip3 install tensorflow==2.4.1
echo "===numpy 1.19.5 install======="
pip3 install numpy==1.19.5
echo "===keras 2.4.3 install======="
pip3 install keras==2.4.3
echo "===matplotlib 3.3.3 install======="
pip3 install matplotlib==3.3.4
echo "===module loading======="
module load tensorflow/2.4.1 numpy/1.19.5 keras/2.4.3 matplotlib/3.3.4
srun echo "============ Scheduling Job Started =============="
srun python3 slurm_tf_python3_mnist.py
srun echo "============ Scheduling Job Done =============="
echo "==========Closing Pythone Virtual Env========="
srun deactivate
echo "===deleting Virtual Env======="
rm -rf /mnt/nfs_slurm/slurm/venvtf241-00
echo "===All of Vertual Env deleted======"
