#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 1
#SBATCH -t 00:30:00
#SBATCH -o /home/yutkueri/private/slurm_messages/prokka_annot.out
#SBATCH -e /home/yutkueri/private/slurm_messages/prokka_annot.err
#SBATCH -J prokka_annot
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load prokka

assembly_file=/home/yutkueri/private/assembly/pacbio.contigs.fasta
out_dir=/home/yutkueri/private/annotation

prokka ${assembly_file} --outdir ${out_dir} --prefix pacbio_assembly_anno