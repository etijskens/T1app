#!/bin/bash

#SBATCH --job-name=mpihello
#SBATCH --nodes=1
#SBATCH --ntasks=128
#SBATCH --cpus-per-task=1
#SBATCH --time=5:00
#SBATCH --exclusive
#SBATCH -A astaff

# Build the environment

module load intel/2021b 
module load hwloc/2.5.0-GCCcore-11.2.0
module load PMIx/4.1.0-GCCcore-11.2.0

# Run the MPI program
srun --mpi=pmix_v3 --quiet -n32 -c1  ./mpihello-core A &
srun --mpi=pmix_v3 --quiet -n32 -c1  ./mpihello-core B &
srun --mpi=pmix_v3 --quiet -n32 -c1  ./mpihello-core C &
srun --mpi=pmix_v3 --quiet -n32 -c1  ./mpihello-core D &
wait
