#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 1
#SBATCH -t 02:00:00
#SBATCH -o /home/yutkueri/private/slurm_messages/spades_assembly.out
#SBATCH -e /home/yutkueri/private/slurm_messages/spades_assembly.err
#SBATCH -J spades_assembly
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load spades/3.15.5

# Your commands

illumina_dir=/home/yutkueri/private/raw_data/genomics_data/Illumina
nanopore_fasta=/home/yutkueri/private/raw_data/genomics_data/Nanopore/E745_all.fasta.gz
outdir=/home/yutkueri/private/assembly/spades_assembly

spades.py --pe1-1 ${illumina_dir}/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz --pe1-2 ${illumina_dir}/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz --nanopore ${nanopore_fasta} -k 55 -o ${outdir}