#!/bin/bash

#SBATCH --job-name=Array1d
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2GB
#SBATCH --time=01:00:00
#SBATCH --array=0-10

if [ "$SLURM_ARRAY_TASK_ID" == "" ]; then exit; fi

cities=(NewYork LosAngeles Chicago Houston Philadephia Phoenix SanAntonio SanDiego Dallas SanJose)

cd /share/apps/examples/jobarry

if [ $SLURM_ARRAY_TASK_ID -lt ${#cities[*]} ]; then
    echo $SLURM_ARRAY_TASK_ID ${cities[$SLURM_ARRAY_TASK_ID]}
fi



