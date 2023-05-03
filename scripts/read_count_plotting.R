# Load the required packages
library(ggplot2)

### Plot the distribution of read counts for each sample

file_list <- list.files(pattern = "\\.txt$")
count_list <- lapply(file_list, read.table, sep = "\t", header = FALSE)

ignore = c("__alignment_not_unique", "__ambiguous", "__no_feature", "__not_aligned", "__too_low_aQual")

counts <- Reduce(function(x, y) merge(x, y, by = 1, all = TRUE), count_list)
counts = as.data.frame(counts)
counts = counts[!counts$V1 %in% ignore,]
colnames(counts) = c("ID", "ERR1797969_Serum", "ERR1797970_Serum", "ERR1797971_Serum", "ERR1797972_BH", "ERR1797973_BH", "ERR1797974_BH")

melted_counts = melt(counts)
ggplot(melted_counts, aes(x = melted_counts$value)) + geom_histogram(binwidth = 10000, fill = "purple") + facet_wrap(melted_counts$variable) + scale_y_log10() + xlab("Gene counts") + ylab("Frequency")


BiocManager::install("GenomicFeatures")
library(GenomicFeatures)
txdb <- makeTxDbFromGFF(file = "/Users/yaseminutkueri/Desktop/GenomeAnalysis/differential_expression_analysis/pacbio_assembly_anno_no_def.gff", format = "gff3")

library(ggplot2)
# group the exons by transcript
exons <- cdsBy(txdb, by = c("tx"))
exons
# make a data frame with transcripts and exon count
exons.tx <- data.frame(tx = 1:length(exons), exons = sapply(exons, length))
# plot
ggplot(exons.tx) + geom_histogram(aes(exons), fill = "blue") + theme_bw()






