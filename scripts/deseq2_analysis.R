# Load the required packages
library("DESeq2")
library(ggplot2)
library("genefilter")
library( "gplots" )
library( "RColorBrewer" )
library(stringr)

### Differential Expression Analysis

directory <- "/Users/yaseminutkueri/Desktop/GenomeAnalysis/differential_expression_analysis/HTSeq_counts/"

serum_files <- grep("Serum",list.files(directory),value=TRUE)
serum_samples <- sub("(.*Serum).*","\\1",serum_files)

BH_files <- grep("BH",list.files(directory),value=TRUE)
BH_samples <- sub("(.*BH).*","\\1",BH_files)

condition = c("BH", "BH", "BH", "Serum", "Serum", "Serum")

sampleTable <- data.frame(sampleName = c(BH_samples, serum_samples),fileName = c(BH_files, serum_files),condition = condition)

sampleTable$condition <- factor(sampleTable$condition)

ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,directory = directory, design= ~condition)
dds <- DESeq(ddsHTSeq)
res <- results(dds)

rld <- rlog(dds, blind=FALSE)
mat = assay(rld)[ head(order(res$padj), 20), ] 
mat = mat - rowMeans(mat) 

deg_df = as.data.frame(colData(rld)[,c("condition")])
colnames(deg_df) = "Growth Medium"
rownames(deg_df) = colnames(mat) 

gene_annotations <- read.gff("/Users/yaseminutkueri/Desktop/GenomeAnalysis/annotation/pacbio_assembly_anno.gff")
gene_anno_df <- cbind(gene_annotations$seqid, sapply(strsplit(sapply(strsplit(gene_annotations$attributes, ";"), `[`, 1), "="), '[', 2), sapply(strsplit(sapply(strsplit(gene_annotations$attributes, ";"), `[`, 2), "="), '[', 2), sapply(strsplit(sapply(strsplit(gene_annotations$attributes, ";"), `[`, 8), "="), '[', 2), gene_annotations$attributes)
gene_anno_df <- as.data.frame(gene_anno_df)

topVarGenes <- head( order( rowVars( assay(rld) ), decreasing=TRUE ), 40 )

gene_anno_df_filtered = gene_anno_df[gene_anno_df$V2 %in% rownames(assay(rld)[ topVarGenes, ]),]

png(filename='/Users/yaseminutkueri/Desktop/GenomeAnalysis/differential_expression_analysis/heatmap.png', 
    width=1000, height=1000)
heatmap.2( assay(rld)[ topVarGenes, ], scale="row", 
           trace="none", dendrogram="column", 
           labCol = c(BH_samples, serum_samples),
           cexRow=1,cexCol=1,margins=c(12,12),
           col = colorRampPalette(rev(brewer.pal(9, "RdBu")) )(255),
           ColSideColors = c( Control="purple", DPN="darkgreen")[
             colData(rld)$condition ] )
graphics.off()










