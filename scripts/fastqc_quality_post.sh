#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 1
#SBATCH -t 00:30:00
#SBATCH -o /home/yutkueri/private/slurm_messages/fastqc_post.out
#SBATCH -e /home/yutkueri/private/slurm_messages/fastqc_post.err
#SBATCH -J fastqc_post
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load FastQC/0.11.9

read_dir=/home/yutkueri/private/trimmed_data

fastqc ${read_dir}/illumina_trimmed_paired_* -o /home/yutkueri/private/quality_checks/illumina_fastqc_post