#!/bin/bash

#SBATCH --job-name=Array2d
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2GB
#SBATCH --time=01:00:00
#SBATCH --array=0-99

if [ "$SLURM_ARRAY_TASK_ID" == "" ]; then exit; fi

cd /share/apps/examples/jobarry

cities=(NewYork LosAngeles Chicago Houston Philadephia Phoenix SanAntonio SanDiego Dallas SanJose)

found=0
k=0
for((i=0; i<10; i++)); do
    for((j=0; j<10; j++)); do
	if [ $k -eq $SLURM_ARRAY_TASK_ID ]; then
	    found=1
	    break
	else
	    k=$((k+1))
	fi
    done
    if [ $found -eq 1 ]; then break; fi
done

echo $SLURM_ARRAY_TASK_ID  ${cities[$i]}  ${cities[$j]} 

exit

