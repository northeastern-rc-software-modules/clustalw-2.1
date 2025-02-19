#!/bin/bash
#SBATCH --job-name=clustalw_perf
#SBATCH --output=../logs/clustalw_perf_%j.log
#SBATCH --error=../logs/clustalw_perf_%j.err
#SBATCH --time=00:20:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=8G
#SBATCH --partition=short

module load clustal/2.1

cd ../data

echo "Running ClustalW with 1 thread..."
time clustalw2 -INFILE=16s_rRNA_sequences.fasta -ALIGN -OUTFILE=../results/aligned_1thread.aln -OUTPUT=FASTA

echo "Running ClustalW with 8 threads..."
time clustalw2 -INFILE=16s_rRNA_sequences.fasta -ALIGN -OUTFILE=../results/aligned_8threads.aln -OUTPUT=FASTA

echo "Performance test complete."
