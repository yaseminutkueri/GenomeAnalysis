#!/bin/bash -l
#SBATCH -A uppmax2023-2-8
#SBATCH -M snowy
#SBATCH -p core -n 8
#SBATCH -t 02:00:00
#SBATCH -o /home/yutkueri/private/slurm_messages/coverage.out
#SBATCH -e /home/yutkueri/private/slurm_messages/coverage.err
#SBATCH -J coverage
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user yasemin.utkueri.3540@student.uu.se

# Load modules
module load bioinfo-tools
module load samtools

read_dir=/home/yutkueri/private/alignment/paired_end

for sample in ERR1797969 ERR1797970 ERR1797971
do

out=/home/yutkueri/private/alignment/paired_end/${sample}_Serum_coverage.txt

samtools depth -@ 8 -a  ${read_dir}/${sample}_Serum_aligned.bam -o ${out}

done

for sample in ERR1797972 ERR1797973 ERR1797974
do

out=/home/yutkueri/private/alignment/paired_end/${sample}_BH_coverage.txt

samtools depth -@ 8 -a  ${read_dir}/${sample}_BH_aligned.bam -o ${out}

done
