#!/bin/sh
mpirun /mnt/graphcore-ipu-demo/slurm/hellompi/mpi_sum -np 20 --hostfile /mnt/graphcore-ipu-demo/slurm/hellompi/mpi_sum.hosts --output-filename /mnt/graphcore-ipu-demo/slurm/hellompi/mpi_sum.out -show-progress -v
