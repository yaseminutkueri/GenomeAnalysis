#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 2
#SBATCH -t 00:30:00
#SBATCH -o /home/yutkueri/private/slurm_messages/blast_db.out
#SBATCH -e /home/yutkueri/private/slurm_messages/blast_db.err
#SBATCH -J blast_db
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load blast

# Commands
reference=/home/yutkueri/private/raw_data/reference.fasta

makeblastdb -in ${reference} -dbtype nucl