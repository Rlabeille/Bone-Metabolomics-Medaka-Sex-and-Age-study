#### Pathway Enrichment Analysis #####
# Input msfile 'peaklist' "mz, adj-p.val, adj-t.score, r.t"


#### Analysis of F8mo_F3mo ####

library(fitdistrplus)
library(RJSONIO)
library(igraph)
library(plyr)

# Load MetaboAnalystR
library(MetaboAnalystR)

# Clean global environment
rm(list = ls())

# Create objects for storing processed data
mSet <- InitDataObjects("mass_all", "mummichog", FALSE)

# inputs is 4 column 'mptr'
mSet <- SetPeakFormat(mSet, "mptr")

# instrument ES-i paramatwers 
mSet <- UpdateInstrumentParameters(mSet, 3.0, "negative", "yes", 0.02)

## input F8mo_F3mo
mSet <- Read.PeakListData(mSet, "C:\\Users\\Remi\\Documents\\TAMUCC M.S chemi\\Medaka Bone metabolic study\\Metaboanalyst_inR\\MetabAnalyst_inR\\MetaboAnalystR_3_29_24\\input_msfile\\msfile2_F8vsF3.txt"
                          
                          , FALSE, "both")
mSet<-SanityCheckMummichogData(mSet)
# rt in minutes
mSet <- SetRTincluded(mSet, "minutes")
# mumichog v2
mSet<-SetPeakEnrichMethod(mSet, "mum", "v2")

# restrictive p.value to consider< 0.5

mSet<-SetMummichogPval(mSet, 0.1)

# ref metabelome is zebrafish, 3 molucule cutoff to consider a pathway
# permorming PSEA using current algorythem
mSet<-PerformPSEA(mSet, "dre_mtf", "current", 3 , 100)


## output results 
#[1] "compoundLib"
#[1] "Got 1136 mass features."
#[1] "434 initial ECs created!"
#[1] "209 merged ECs identified!"
#[1] "39 empirical compounds identified in 3.75344353119532 seconds."
#[1] "A total of 7188 of duplicates were merged."
#[1] "A total of 7179 of duplicates were merged."
#[1] "A total of 7179 of duplicates were merged."
#[1] "A total of 7188 of duplicates were merged."
#[1] "A total of 7185 of duplicates were merged."
#[1] "A total of 7185 of duplicates were merged."
#[1] "A total of 7188 of duplicates were merged."
#[1] "A total of 7179 of duplicates were merged."
#[1] "Resampling,  100 permutations to estimate background ..."

####  Analysis of M8mo_M3mo ####
# Load MetaboAnalystR
library(MetaboAnalystR)

# Clean global environment
rm(list = ls())

# Create objects for storing processed data
mSet <- InitDataObjects("mass_all", "mummichog", FALSE)

# inputs is 4 column 'mptr'
mSet <- SetPeakFormat(mSet, "mptr")

# instrument ES-i paramatwers 
mSet <- UpdateInstrumentParameters(mSet, 3.0, "negative", "yes", 0.02)

## input F8mo_F3mo
mSet <- Read.PeakListData(mSet, "C:/Users/Remi/Documents/TAMUCC M.S chemi/Medaka Bone metabolic study/Metaboanalyst Medaka Bone 1_12_24/SEXandAGE_CompoundDiscoverer_MetaboAnalyst_EnrichmentAnalysis/MetabolicDataF8mo_F3mo.txt"
                          
                          , FALSE, "pvalue")
mSet<-SanityCheckMummichogData(mSet)

# mumichog v2
mSet<-SetPeakEnrichMethod(mSet, "mum", "v2")

# restrictive p.value to consider< 0.2

mSet<-SetMummichogPval(mSet, 0.2)

# ref metabelome is zebrafish, 3 molucule cutoff to consider a pathway
# permorming PSEA using current algorythem
mSet<-PerformPSEA(mSet, "dre_mtf", "current", 3 , 100)

mSet<-PlotPSEAIntegPaths(mSet, "integ_peaks_0_", "png", 72, width=NA)
####  Analysis of M8mo_M3mo ####
# Load MetaboAnalystR
library(MetaboAnalystR)

# Clean global environment
rm(list = ls())

# Create objects for storing processed data
mSet <- InitDataObjects("mass_all", "mummichog", FALSE)

# inputs is 4 column 'mptr'
mSet <- SetPeakFormat(mSet, "mptr")

# instrument ES-i paramatwers 
mSet <- UpdateInstrumentParameters(mSet, 3.0, "negative", "yes", 0.02)

## input F8mo_F3mo
mSet <- Read.PeakListData(mSet, "C:/Users/Remi/Documents/TAMUCC M.S chemi/Medaka Bone metabolic study/Metaboanalyst Medaka Bone 1_12_24/SEXandAGE_CompoundDiscoverer_MetaboAnalyst_EnrichmentAnalysis/MetabolicDataF8mo_F3mo.txt"
                          
                          , FALSE, "pvalue")
mSet<-SanityCheckMummichogData(mSet)

# mumichog v2
mSet<-SetPeakEnrichMethod(mSet, "mum", "v2")

# restrictive p.value to consider< 0.2

mSet<-SetMummichogPval(mSet, 0.2)

# ref metabelome is zebrafish, 3 molucule cutoff to consider a pathway
# permorming PSEA using current algorythem
mSet<-PerformPSEA(mSet, "dre_mtf", "current", 3 , 100)

mSet<-PlotPSEAIntegPaths(mSet, "integ_peaks_0_", "png", 72, width=NA)
####  Analysis of M8mo_M3mo ####
# Load MetaboAnalystR
library(MetaboAnalystR)

# Clean global environment
rm(list = ls())

# Create objects for storing processed data
mSet <- InitDataObjects("mass_all", "mummichog", FALSE)

# inputs is 4 column 'mptr'
mSet <- SetPeakFormat(mSet, "mptr")

# instrument ES-i paramatwers 
mSet <- UpdateInstrumentParameters(mSet, 3.0, "negative", "yes", 0.02)

## input F8mo_F3mo
mSet <- Read.PeakListData(mSet, "C:/Users/Remi/Documents/TAMUCC M.S chemi/Medaka Bone metabolic study/Metaboanalyst Medaka Bone 1_12_24/SEXandAGE_CompoundDiscoverer_MetaboAnalyst_EnrichmentAnalysis/MetabolicDataF8mo_F3mo.txt"
                          
                          , FALSE, "pvalue")
mSet<-SanityCheckMummichogData(mSet)

# mumichog v2
mSet<-SetPeakEnrichMethod(mSet, "mum", "v2")

# restrictive p.value to consider< 0.2

mSet<-SetMummichogPval(mSet, 0.2)

# ref metabelome is zebrafish, 3 molucule cutoff to consider a pathway
# permorming PSEA using current algorythem
mSet<-PerformPSEA(mSet, "dre_mtf", "current", 3 , 100)

mSet<-PlotPSEAIntegPaths(mSet, "integ_peaks_0_", "png", 72, width=NA)