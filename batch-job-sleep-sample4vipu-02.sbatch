#!/bin/bash
#
#SBATCH --job-name=batch-job-sleep-sample4vipu-02
#SBATCH --partition=v-ipu
#SBATCH --output=batch-job-sleep-sample4vipu-02-result-%j.out
#SBACTH --error=batch-job-sleep-sample4vipu-02-error-%j.err
#SBATCH --ntasks=10
#SBATCH --time=10:00
srun sleep 30
srun hostname

