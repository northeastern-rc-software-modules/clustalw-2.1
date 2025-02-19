#!/bin/bash
#SBATCH --job-name=clustalw_validate
#SBATCH --output=../logs/clustalw_validate_%j.log
#SBATCH --error=../logs/clustalw_validate_%j.err
#SBATCH --time=00:10:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --partition=short

cd ../results || { echo "Error: Results directory not found"; exit 1; }

echo "Checking if alignment files were created..."

if [[ -f "aligned_16s_rRNA.aln" ]]; then
    echo "Alignment file for 16S rRNA exists."
    head aligned_16s_rRNA.aln
else
    echo "Error: 16S rRNA alignment file not found."
    exit 1
fi

