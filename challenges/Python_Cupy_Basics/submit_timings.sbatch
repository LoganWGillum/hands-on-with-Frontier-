#!/bin/bash
#SBATCH -A TRN016
#SBATCH -J cupy_timings
#SBATCH -o %x-%j.out
#SBATCH -t 0:10:00
#SBATCH -p batch
#SBATCH -N 1

date

module load PrgEnv-gnu
module load rocm/5.3.0
module load craype-accel-amd-gfx90a

source deactivate_envs.sh

source activate /ccs/home/${USER}/.conda/envs/cupy-frontier

srun -n1 --gpus-per-task=1 --gpu-bind=closest python3 timings.py
