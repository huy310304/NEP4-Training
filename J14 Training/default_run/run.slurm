#!/bin/bash
#SBATCH -A elmgroup_standard
#SBATCH --ntasks=1
#SBATCH --time=8:00:00
#SBATCH --output=outputfile
#SBATCH --error=errorfile
#SBATCH --partition=gpu #parallel  #-partition serial  ## parallel
#SBATCH -p gpu
#SBATCH --gres=gpu:a100:1
module load gcc 
module load cuda
/project/elmgroup/GPUMD-Multilayer/src/nep < nep.in > outputfile
