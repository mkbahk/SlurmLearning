#!/bin/bash
#
#SBATCH --job-name=batch-job-sleep-sample4vipu-01
#SBATCH --partition=v-ipu
#SBATCH --output=batch-job-sleep-sample4vipu-01-result-%j.txt
#SBACTH --error=batch-job-sleep-sample4vipu-01-error-%j.err
#SBATCH --ntasks=10
#SBATCH --time=10:00
srun sleep 30
srun hostname

