#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 2
#SBATCH -t 05:00:00
#SBATCH -o /home/yutkueri/private/slurm_messages/canu_assembly.out
#SBATCH -e /home/yutkueri/private/slurm_messages/canu_assembly.err
#SBATCH -J canu_assembly
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load canu

# Commands
read_dir=/home/yutkueri/private/raw_data/genomics_data/PacBio

canu \
-p pacbio -d /home/yutkueri/private/assembly \
genomeSize=3.0m useGrid=true gridOptions="-A uppmax2023-2-8 -t 01:00:00" \
-pacbio-raw ${read_dir}/*.subreads.fastq.gz