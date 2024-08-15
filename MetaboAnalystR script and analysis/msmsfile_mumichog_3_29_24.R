#### example ####
install.packages("fitdistrplus")
install.packages("RJSONIO")
install.packages("igraph")

library(fitdistrplus)
library(RJSONIO)
library(igraph)

# Load MetaboAnalystR
library(MetaboAnalystR)

# Clean global environment
rm(list = ls())
# Create objects for storing processed data
mSet <- InitDataObjects("mass_all", "mummichog", FALSE)
# Only positive mode (ESI+) included
mSet <- SetPeakFormat(mSet, "mpt")
mSet <- SetMS2IDType(mSet, "inchikeys")
mSet <- UpdateInstrumentParameters(mSet, 15.0, "mixed", "yes", 0.02)

# Read in MS peaks and MS/MS based compounds 

mSet <- Read.PeakMS2ListData(mSet, msfile = "C:/Users/Remi/Documents/TAMUCC M.S chemi/Medaka Bone metabolic study/Metaboanalyst_inR/MetabAnalyst_inR/DataCleanUp_input to online data bank/MetaboAnalyst_R_troubleshoot_msmsfile/Given_data_test_input_msfile_msmsfile/msfile_5.txt",
                             msmsfile = "C:/Users/Remi/Documents/TAMUCC M.S chemi/Medaka Bone metabolic study/Metaboanalyst_inR/MetabAnalyst_inR/DataCleanUp_input to online data bank/MetaboAnalyst_R_troubleshoot_msmsfile/Given_data_test_input_msfile_msmsfile/msmsfile_5.txt")
mSet <- SanityCheckMummichogData(mSet)
# Set parameters
# Set Retention time unit as "seconds"
# set algorithm as "mummichog" and version 2
# Here we use the top 10% peaks as the p value cutoff
mSet <- SetRTincluded(mSet, "seconds")
mSet <- SanityCheckMummichogData(mSet)
mSet<-SetPeakEnrichMethod(mSet, "mum", "v1")
pval <- sort(mSet[["dataSet"]][["mummi.proc"]][["p.value"]])[ceiling(length(mSet[["dataSet"]][["mummi.proc"]][["p.value"]])*0.1)]
mSet<-SetMummichogPval(mSet, 0.9)

# Perform functional analysis
mSet<-PerformPSEA(mSet, "hsa_mfn", "current", 3 , 100)

mSet<-PlotPeaks2Paths(mSet, "2peaks_to_paths_msms_", "png", 72, width=8)
