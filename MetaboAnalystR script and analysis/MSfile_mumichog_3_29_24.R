
# Load MetaboAnalystR
library(MetaboAnalystR)

# Clean global environment
rm(list = ls())

# Create objects for storing processed data
mSet <- InitDataObjects("mass_all", "mummichog", FALSE)

mSet <- SetPeakFormat(mSet, "mpt")

mSet <- UpdateInstrumentParameters(mSet, 14.0, "negative", "yes", 0.02)

##
mSet <- Read.PeakListData(mSet, "C:/Users/Remi/Documents/TAMUCC M.S chemi/Medaka Bone metabolic study/Metaboanalyst Medaka Bone 1_12_24/SEXandAGE_CompoundDiscoverer_MetaboAnalyst_EnrichmentAnalysis/MetabolicDataM8mo_F8mo.txt"

                        , FALSE, "pvalue")
mSet<-SanityCheckMummichogData(mSet)

mSet<-SetPeakEnrichMethod(mSet, "mum", "v2")

mSet<-SetMummichogPval(mSet, 0.9)

mSet<-PerformPSEA(mSet, "dre_mtf", "current", 3 , 100)

mSet<-PlotPSEAIntegPaths(mSet, "integ_peaks_0_", "png", 72, width=NA)