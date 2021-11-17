#!/bin/bash
#SBATCH --job-name=batch-job-sleep-test-ping
#SBATCH --partition=v-ipu
#SBATCH --output=batch-job-sleep-test-ping-result_%j.out
#SBATCH --error=batch-job-sleep-test-ping-error_%j.err
#SBATCH --ntasks=1
#SBATCH --time=00:01
srun echo "=========Serial Job Started..==========="
srun sleep 10
srun hostname
srun ifconfig
srun ping 8.8.8.8 -c 10
srun echo "=============Job Ended..================"
