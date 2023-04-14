#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 1
#SBATCH -t 00:30:00
#SBATCH -o /home/yutkueri/private/slurm_messages/quast_eval_both.out
#SBATCH -e /home/yutkueri/private/slurm_messages/quast_eval_both.err
#SBATCH -J quast_eval_both
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load quast/5.0.2

canu_assembly_file=/home/yutkueri/private/assembly/canu_assembly/pacbio.contigs.fasta
spades_assembly_file=/home/yutkueri/private/assembly/spades_assembly/contigs.fasta
out_dir=/home/yutkueri/private/quality_checks/both_quast
reference=/home/yutkueri/private/raw_data/reference.fasta

quast.py ${canu_assembly_file} ${spades_assembly_file} -l Canu,Spades -r ${reference} -o ${out_dir} 