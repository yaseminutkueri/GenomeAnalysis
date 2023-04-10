#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 1
#SBATCH -t 10:00:00
#SBATCH -o /home/yutkueri/private/slurm_messages/deg.out
#SBATCH -e /home/yutkueri/private/slurm_messages/deg.err
#SBATCH -J deg
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load htseq

bam_dir=/home/yutkueri/private/alignment/paired_end/
gff_file=/home/yutkueri/private/deg/pacbio_assembly_anno_no_def.gff
outdir=/home/yutkueri/private/deg

for bamfile in ${bam_dir}*.bam
do
sample_name="${bamfile:44}"
htseq-count -f bam -t CDS -i locus_tag ${bamfile} ${gff_file} > ${outdir}/${sample_name}.readcounts.txt
done
