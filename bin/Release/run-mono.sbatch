#!/bin/bash

#SBATCH --job-name=ChessDTS_Worker
#SBATCH --nodes=1 --ntasks-per-node=1
#SBATCH --time=24:00:00
#SBATCH --mem=2GB
#SBATCH --output=worker2.out
#SBATCH --error=worker_%A_%a.err
#SBATCH --array=0-179

module purge
module load mono/intel/4.8.0

srun mono Sabbertest2.exe