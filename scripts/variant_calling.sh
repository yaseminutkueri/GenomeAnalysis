#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 4
#SBATCH -t 00:30:00
#SBATCH -o /home/yutkueri/private/slurm_messages/variant_calling.out
#SBATCH -e /home/yutkueri/private/slurm_messages/variant_calling.err
#SBATCH -J variant_calling
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load bcftools

read_dir=/home/yutkueri/private/raw_data/genomics_data/Illumina
out_file=/home/yutkueri/private/variant_calling/canu_assembly.vcf
reference=/home/yutkueri/private/raw_data/reference_genome/reference.fasta


bowtie2 -p 4 -x ${bowtie_idx} -U ${fastq_dir}/fly_${n}.fq.gz | samtools sort -@ 4 -o ${species}/sample${n}/${species}_alignment.bam

echo "indexing and samtools sorting completed"

samtools index -@ 4 ${species}/sample${n}/${species}_alignment.bam ${species}/sample${n}/${species}_alignment.bai

echo "samtools indexing completed"

bcftools mpileup --threads 4 -f ${reference} ${assembly_file} | bcftools call --threads 4 -mv -Ob | bcftools view --threads 8 -o ${out_file}

