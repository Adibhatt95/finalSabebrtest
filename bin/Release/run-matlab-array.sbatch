#!/bin/bash

#SBATCH --job-name=MatArray
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2GB
#SBATCH --time=01:00:00
#SBATCH --array=0-9

module purge
module load matlab/2016b

cd /share/apps/examples/jobarry

args=(1.0 1.2 2.3 4.6 9.7 12.5 -13.7 200.23 89.23 1000.234)

x=${args[$SLURM_ARRAY_TASK_ID]}

cat<<EOF | matlab -nodisplay
fprintf('%8.4f\n', $x)
exit
EOF




