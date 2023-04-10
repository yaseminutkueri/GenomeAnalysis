#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 1
#SBATCH -t 02:00:00
#SBATCH -o /home/yutkueri/private/slurm_messages/illumina_trim.out
#SBATCH -e /home/yutkueri/private/slurm_messages/illumina_trim.err
#SBATCH -J illumina_trim
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load trimmomatic/0.39

read_dir=/home/yutkueri/private/raw_data/genomics_data/Illumina
out_dir=/home/yutkueri/private/trimmed_data

trimmomatic PE -phred33 ${read_dir}/* ${out_dir}/illumina_trimmed_paired_1.fq.gz ${out_dir}/illumina_trimmed_unpaired_1.fq.gz ${out_dir}/illumina_trimmed_paired_2.fq.gz ${out_dir}/illumina_trimmed_unpaired_2.fq.gz ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.39/rackham/adapters/TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 MINLEN:36 