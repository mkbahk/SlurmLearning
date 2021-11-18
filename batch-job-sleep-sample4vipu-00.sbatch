#!/bin/bash
#
#SBATCH --job-name=batch-job-sleep-sample4vipu-00
#SBATCH --partition=v-ipu
#SBATCH --output=batch-job-sleep-sample4vipu-00-result-%j.out
#SBACTH --error=batch-job-sleep-sample4vipu-00-error-%j.err
#SBATCH --ntasks=10
#SBATCH --time=10:00
srun sleep 30
srun hostname

