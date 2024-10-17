# Workflow for "Community conservatism is widespread throughout microbial phyla and environments"


This repository contains the custom scripts used in the Manuscript "Community conservatism is widespread throughout microbial phyla and environments". 

The following packages and programs are needed:

MAPseq v.2.2.1 
fastTree  2.1.10
HPC-CLUST v1.1.0 
FlashWeave v.0.19.0 
Python 3.7.6
Python libraries:
    numpy 1.18.1
    Pandas 1.0.3
    bokeh 2.2.3
    ete3 3.1.2
    holoviews 0.11.6
    scipy 1.4.1
    WordCloud 1.5.0  


For the workflow, we here show the general trend containing all fully annotated microbes (bacteria&archaea). The workflow was then repeated seperately for each shown envionment (animal, marine, freshwater plant and soil) as well as for all phyla which contain >500 99% OTUs. 

First, phylogenetic trees are contructed with the "make_all_trees" ipyndb workbook. These trees are converted into a pairwise tree branch length matrix, which is then used to select OTU-pairs following a uniform distribution. This is reproducible via the "select_taxa" script, where the distances are used to obtain bins and fill them with different OTU-pairs, as well as save the respective files. The OTU-pairs are then used to compute the ß-similarity values of all sample-sample comparisons off the two OTUs, as well as additional metrics such as sequence similarity, main evironment etc. (See Methods of Paper) 

All of these are combined into one file, which is then further processed to plot most results.

The file "microbes_result_combined.csv" contains the main results of the general microbial trend needed to reproduce the main result figures. Follow the scipt "main_figure_plots" to obtain said plots, and experiment using different percentiles etc. 
