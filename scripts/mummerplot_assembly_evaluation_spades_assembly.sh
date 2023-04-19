#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 1
#SBATCH -t 00:30:00
#SBATCH -o /home/yutkueri/private/slurm_messages/mummer_eval_spades.out
#SBATCH -e /home/yutkueri/private/slurm_messages/mummer_eval_spades.err
#SBATCH -J mummer_eval_spades
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load MUMmer/3.23

assembly_file=/home/yutkueri/private/assembly/spades_assembly/contigs.fasta
out_dir=/home/yutkueri/private/quality_checks/spades_assembly/mummerplot_eval
reference=/home/yutkueri/private/raw_data/reference_genome/reference.fasta

mummer -mum -b ${reference} ${assembly_file} > ${out_dir}/spades_assembly.mum
mummerplot -Q ${assembly_file} -t png -p ${out_dir}/spades_assembly_mummerplot  ${out_dir}/spades_assembly.mum