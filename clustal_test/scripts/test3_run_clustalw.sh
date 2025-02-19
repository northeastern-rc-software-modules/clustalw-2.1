#!/bin/bash
#SBATCH --job-name=clustalw_run
#SBATCH --output=../logs/clustalw_run_%j.log
#SBATCH --error=../logs/clustalw_run_%j.err
#SBATCH --time=00:30:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --partition=short

module load clustal/2.1

cd ../data || { echo "Error: Data directory not found"; exit 1; }

if [[ ! -f "16s_rRNA_sequences.fasta" ]]; then
    echo "Error: NCBI 16S rRNA sequence file is missing"
    exit 1
fi


echo "Running ClustalW for 16S rRNA multiple sequence alignment..."
clustalw2 -INFILE=16s_rRNA_sequences.fasta -ALIGN -OUTFILE=../results/aligned_16s_rRNA.aln -OUTPUT=FASTA


echo "ClustalW alignment completed."
