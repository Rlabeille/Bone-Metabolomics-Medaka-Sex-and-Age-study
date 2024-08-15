#### Pathway Enrichment Analysis #####
# Input msfile 'peaklist' "mz, adj-p.val, adj-t.score, r.t"


#### Analysis of F8mo_F3mo ####


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