#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 1
#SBATCH -t 00:30:00
#SBATCH -o /home/yutkueri/private/slurm_messages/index_assembly.out
#SBATCH -e /home/yutkueri/private/slurm_messages/index_assembly.err
#SBATCH -J index_assembly
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa

assembly_file=/home/yutkueri/private/assembly/pacbio.contigs.fasta
illumina_read_dir=/home/yutkueri/private/annotation

bwa index ${assembly_file}