#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 4
#SBATCH -t 00:30:00
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load blast

# Commands
reference=/home/yutkueri/private/raw_data/reference_genome/reference.fasta
contig_fasta=/home/yutkueri/private/assembly/canu_assembly/contig_fastas/tig0000000
out_dir=/home/yutkueri/private/blast_results/per_contig

no=$1

blastn -num_threads 4 -query ${contig_fasta}${no}.fa -db nt -out ${out_dir}/contig_${no}.tsv -outfmt 6
