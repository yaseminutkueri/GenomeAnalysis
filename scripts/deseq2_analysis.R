# Load the required packages
library("DESeq2")
library(ggplot2)
library("pheatmap") 
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

pheatmap(mat, annotation_col=deg_df)
















