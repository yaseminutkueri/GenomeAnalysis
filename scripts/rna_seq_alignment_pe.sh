#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 1
#SBATCH -t 01:30:00
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa
module load samtools

sample=$1
source=$2

assembly_file=/home/yutkueri/private/assembly/pacbio.contigs.fasta
read_dir=/home/yutkueri/private/raw_data/transcriptomics_data/RNA-Seq_${source}
out_dir=/home/yutkueri/private/alignment/paired_end

bwa mem ${assembly_file} ${read_dir}/trim_paired_${sample}_pass_1.fastq.gz ${read_dir}/trim_paired_${sample}_pass_2.fastq.gz | samtools view -b | samtools sort -o ${out_dir}/${sample}_${source}_aligned.bam

