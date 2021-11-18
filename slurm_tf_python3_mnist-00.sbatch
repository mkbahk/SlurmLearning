#!/bin/bash
#SBATCH --job-name=slurm_tf_python3_mnist-00
#SBATCH --partition=v-ipu
#SBATCH -D .
#SBATCH --output=/mnt/nfs_slurm/slurm/slurm_tf_python3_mnist-00-output_%j.out
#SBATCH --error=/mnt/nfs_slurm/slurmslurm_tf_python3_mnist-00-error_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --time=00:10:00
python3 -m venv /mnt/nfs_slurm/slurm/venvtf241-00
source /mnt/nfs_slurm/slurm/venvtf241-00/bin/activate
pip3 install -U pip
pip3 install tensorflow==2.4.1
pip3 install numpy==1.19.5
pip3 install keras==2.4.3
pip3 install matplotlib==3.3.4
module load tensorflow/2.4.1 numpy/1.19.5 keras/2.4.3 matplotlib/3.3.4
srun python3 slurm_tf_python3_mnist.py
rm -rf /mnt/nfs_slurm/slurm/venvtf241-00
echo "=========Job Done==============="
