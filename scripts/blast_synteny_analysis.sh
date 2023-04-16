#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 2
#SBATCH -t 00:30:00
#SBATCH -o /home/yutkueri/private/slurm_messages/blast_synteny.out
#SBATCH -e /home/yutkueri/private/slurm_messages/blast_synteny.err
#SBATCH -J blast_synteny
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load blast

# Commands
reference=/home/yutkueri/private/raw_data/reference_genome/reference.fasta
canu_assembly_file=/home/yutkueri/private/assembly/canu_assembly/pacbio.contigs.fasta
out_file=/home/yutkueri/private/blast_results/blast_results.txt

blastn -query ${canu_assembly_file} -db ${reference} -out ${out_file} -outfmt 6
