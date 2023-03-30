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

bam_dir=/home/yutkueri/private/alignment/paired_end
gff_file=/home/yutkueri/private/annotation/pacbio_assembly_anno.gff
outfile=/home/yutkueri/private/deg/rnaseq_counts.txt

htseq-count -f bam alignment/paired_end/ERR1797969_Serum_aligned.bam alignment/paired_end/ERR1797972_BH_aligned.bam alignment/paired_end/ERR1797970_Serum_aligned.bam alignment/paired_end/ERR1797973_BH_aligned.bam alignment/paired_end/ERR1797971_Serum_aligned.bam alignment/paired_end/ERR1797974_BH_aligned.bam ${gff_file}