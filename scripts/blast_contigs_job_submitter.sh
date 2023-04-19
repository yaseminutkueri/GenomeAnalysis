for no in {1..9}
do

out=/home/yutkueri/private/slurm_messages/blast_per_contig/contig_${no}

sbatch --error=${out}.err --output=${out}.out --job-name=blast_per_contig_${no} scripts/blast_per_contig.sh ${no}
done