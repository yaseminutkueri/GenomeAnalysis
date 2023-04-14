#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 1
#SBATCH -t 00:30:00
#SBATCH -o /home/yutkueri/private/slurm_messages/quast_eval.out
#SBATCH -e /home/yutkueri/private/slurm_messages/quast_eval.err
#SBATCH -J quast_eval
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load quast/5.0.2

assembly_file=/home/yutkueri/private/assembly/canu_assembly/pacbio.contigs.fasta
out_dir=/home/yutkueri/private/quality_checks/canu_assembly
reference=/home/yutkueri/private/raw_data/reference.fasta

quast.py ${assembly_file} -r ${reference} -o ${out_dir} 