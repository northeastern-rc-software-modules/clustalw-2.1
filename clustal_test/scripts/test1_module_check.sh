#!/bin/bash
#SBATCH --job-name=clustalw_module_check
#SBATCH --output=../logs/clustalw_module_check_%j.log
#SBATCH --error=../logs/clustalw_module_check_%j.err
#SBATCH --time=00:05:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --partition=short

echo "Loading ClustalW module..."
module load clustal/2.1 || { echo "Error: ClustalW module not found"; exit 1; }

echo "Checking ClustalW version..."
clustalw2  -help

