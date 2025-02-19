#!/bin/bash
#SBATCH --job-name=clustalw_download_data
#SBATCH --output=../logs/clustalw_download_data_%j.log
#SBATCH --error=../logs/clustalw_download_data_%j.err
#SBATCH --time=00:10:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --partition=short

cd ../data || { echo "Error: Data directory not found"; exit 1; }

echo "Downloading real 16S rRNA sequences from NCBI..."
wget -O 16s_rRNA_sequences.fasta "https://raw.githubusercontent.com/biopython/biopython/master/Doc/examples/ls_orchid.fasta"


echo "Download complete."
