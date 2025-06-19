


setwd("/datapath/")
library("tidyverse") # for general data wrangling and plotting
library("SIAMCAT")   # for statistical and ML analyses
library("ape")
library("stringr")
library("vegan")
library("ggplot2")
library("ggtree")


taxname="90_104"

#load the matrix with combined clustering 
data_loc <- paste0("/datalocation/",taxname,"/",taxname,"matrix_inv.tsv")

tax.profiles <- read.table(data_loc, sep = '\t', quote ='',
                           comment.char ='',
                           stringsAsFactors = FALSE, check.names = FALSE, row.names=1, header = TRUE)

tax.profiles <- read.table(data_loc, sep = '\t', row.names=1, header = TRUE)
tax.profiles[is.na(tax.profiles)] <- 0

dist_obj <- as.dist(tax.profiles)

hc=hclust(dist_obj,method="average")


# Convert hclust to a 'phylo' object (required by ggtree)
phylo_tree <- as.phylo(hc)

phylo_tree$edge.length <- rep(1, length(phylo_tree$edge.length))  # Uniform lengths


ggtree(phylo_tree, layout="circular") +  # or "circular"
  geom_tiplab(align=TRUE, size=2.5) +
  scale_x_continuous()  # Add padding
# Plot as a circular tree


#Now the same for the sequence similarity only

data_loc1 <- paste0("/dataloc/",taxname,"/",taxname,"matrix_seq_inv.tsv")

tax.profiles_seq <- read.table(data_loc1, sep = '\t', quote ='',
                           comment.char ='',
                           stringsAsFactors = FALSE, check.names = FALSE, row.names=1, header = TRUE)



d2<- as.dist(tax.profiles_seq)

hc2=hclust(d2,method="average")
plot(hc2)

phylo_tree2 <- as.phylo(hc2)

phylo_tree2$edge.length <- rep(1, length(phylo_tree2$edge.length))  # Uniform lengths

ggtree(phylo_tree2, layout="circular") +  # or "circular"
  geom_tiplab(align=TRUE, size=2.5) +
  scale_x_continuous()  # Add padding

