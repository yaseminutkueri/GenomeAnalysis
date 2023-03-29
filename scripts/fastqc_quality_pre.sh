#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 1
#SBATCH -t 00:30:00
#SBATCH -o /home/yutkueri/private/slurm_messages/fastqc_pre.out
#SBATCH -e /home/yutkueri/private/slurm_messages/fastqc_pre.err
#SBATCH -J fastqc_pre
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load FastQC/0.11.9

read_dir=/home/yutkueri/private/raw_data/genomics_data/Illumina

fastqc ${read_dir}/* -o /home/yutkueri/private/quality_checks/illumina_fastqc_pre