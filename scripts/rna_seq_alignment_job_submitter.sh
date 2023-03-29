for sample in ERR1797972 ERR1797973 ERR1797974
do

out=/home/yutkueri/private/slurm_messages/rna_seq_alignment_${sample}_pe

sbatch --error=${out}.err --output=${out}.out --job-name=rna_seq_alignment_${sample} scripts/rna_seq_alignment_pe.sh ${sample} BH 

done

for sample in ERR1797969 ERR1797970 ERR1797971
do

out=/home/yutkueri/private/slurm_messages/rna_seq_alignment_${sample}_pe

sbatch --error=${out}.err --output=${out}.out --job-name=rna_seq_alignment_${sample} scripts/rna_seq_alignment_pe.sh ${sample} Serum

done