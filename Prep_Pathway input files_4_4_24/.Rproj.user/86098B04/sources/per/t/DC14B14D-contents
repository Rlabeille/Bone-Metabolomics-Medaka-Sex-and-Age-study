# Load necessary packages
library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(openxlsx)

#### STEP 1.1 build DF_1 from "mummichog_pathway_enrichment_mummichog" ####

# Replace the file path with your actual file path
file_path <- "C:/Users/Remi/Documents/TAMUCC M.S chemi/Medaka Bone metabolic study/Metaboanalyst_inR/MetabAnalyst_inR/MetaboAnalystR_3_29_24/S1_M3moVSF3mo_out/mummichog_pathway_enrichment_mummichog.csv"

# Load the CSV file
DF_1 <- read.csv(file_path)

### cpd.hits conversion to stringlist
# Split the 'cpd.hits' column into a list of vectors
DF_1$cpd.hits_list <- strsplit(as.character(DF_1$cpd.hits), ";")

# Check the structure of the modified data frame
str(DF_1)

#### STEP 1.2 build DF_2 ####

# Replace the file path with your actual file path
file_path <- "C:/Users/Remi/Documents/TAMUCC M.S chemi/Medaka Bone metabolic study/Metaboanalyst_inR/MetabAnalyst_inR/MetaboAnalystR_3_29_24/S1_M3moVSF3mo_out/mummichog_matched_compound_all.csv"

# Load the CSV file
DF_2 <- read.csv(file_path)

# Check the structure of the modified data frame
str(DF_2)

#### STEP 1.3 build DF_3 from "msfile2_input" ####

# Replace the file path with your actual file path
file_path <- "C:/Users/Remi/Documents/TAMUCC M.S chemi/Medaka Bone metabolic study/Metaboanalyst_inR/MetabAnalyst_inR/MetaboAnalystR_3_29_24/input_msfile/msfile2_M3vsF3.txt"

# Load the tab-separated text file
DF_3 <- read.table(file_path, header = TRUE, sep = "\t")

# Check the structure of the loaded data
str(DF_3)

#### STEP 1.4 making F8vsF3 ####

DF_4 <- DF_3

# Merge DF_4 with DF_2 based on matching 'm.z' and 'Query.Mass' columns
merged_data <- merge(DF_4, DF_2, by.x = "m.z", by.y = "Query.Mass", all.x = TRUE)

#### make list ####

# Create DF_5 by expanding the cpd.hits_list column
DF_5 <- DF_1 %>%
  unnest(cpd.hits_list)

# Print DF_5
print(DF_5)

# Remove rows with empty or NA 'Matched.Compound'
cleaned_merged_data <- merged_data[!is.na(merged_data$Matched.Compound) & merged_data$Matched.Compound != "", ]

# Calculate the mean 't.score' for each 'Matched.Compound'
cleaned_merged_data$t.score <- as.numeric(cleaned_merged_data$t.score)
merged_rows <- aggregate(t.score ~ Matched.Compound, cleaned_merged_data, mean)

# Create 'F8vsF3.data' with row names as 'Matched.Compound'
F8vsF3.data <- data.frame(row.names = merged_rows$Matched.Compound)

# Add 'ex1' column with the mean 't.score' values
F8vsF3.data$ex1 <- merged_rows$t.score

# Print 'F8vsF3.data'
print(F8vsF3.data)

####

# Get unique pathway names
pathway_names <- unique(DF_5$X)

# Create a list to store the dataframes
pathway_dfs <- list()

# Loop over each pathway name
for (pathway_name in pathway_names) {
  # Subset DF_5 for the current pathway
  pathway_df <- DF_5[DF_5$X == pathway_name, ]
  # Store the subset dataframe in the list
  pathway_dfs[[pathway_name]] <- pathway_df
}

# Print the list of dataframes
print(pathway_dfs)

# Access a specific pathway dataframe (e.g., pathway named 'Pathway1')
print(pathway_dfs[["Pathway1"]])

#####

# Function to convert empirical compound names to KEGG IDs
convert_to_kegg <- function(compounds, merged_data) {
  # Extract the empirical compounds from the string
  compounds_list <- unlist(strsplit(gsub("[c()']", "", compounds), ", "))
  # Match the empirical compounds to KEGG IDs
  kegg_ids <- merged_data$Matched.Compound[match(compounds_list, merged_data$Empirical.Compound)]
  # Return the KEGG IDs as a vector
  return(paste("c(", paste(kegg_ids, collapse = ", "), ")", sep=""))
}

# Apply the conversion function to each pathway dataframe in the list
pathway_dfs <- lapply(pathway_dfs, function(pathway_df) {
  pathway_df$KEGG.list <- sapply(pathway_df$cpd.hits_list, convert_to_kegg, merged_data = merged_data)
  return(pathway_df)
})

# Print the updated pathway dataframes
print(pathway_dfs)

####

# Function to convert empirical compound names to KEGG IDs using t.score
convert_to_kegg <- function(compounds, merged_data) {
  # Extract the empirical compounds from the string
  compounds_list <- unlist(strsplit(gsub("[c()']", "", compounds), ", "))
  # Match the empirical compounds to KEGG IDs using t.score
  kegg_ids <- merged_data$t.score[match(compounds_list, merged_data$Empirical.Compound)]
  # Return the KEGG IDs as a vector
  return(paste("c(", paste(kegg_ids, collapse = ", "), ")", sep=""))
}

# Apply the conversion function to each pathway dataframe in the list
pathway_dfs <- lapply(pathway_dfs, function(pathway_df) {
  pathway_df$t.score.val <- sapply(pathway_df$cpd.hits_list, convert_to_kegg, merged_data = merged_data)
  return(pathway_df)
})

# Print the updated pathway dataframes
print(pathway_dfs)

### making tables for figures 2 and 3 ###

# Create a helper function to check for matches and return the corresponding pathway
get_pathways <- function(empirical_compound, df_1) {
  # Filter DF_1 rows where cpd.hits contains the empirical_compound
  matching_rows <- df_1 %>%
    filter(str_detect(cpd.hits, empirical_compound))
  
  # If there are matching rows, return the X column values concatenated
  if (nrow(matching_rows) > 0) {
    return(paste(matching_rows$X, collapse = ", "))
  } else {
    return(NA)
  }
}

# Apply the helper function to each row in merged_data
merged_data <- merged_data %>%
  mutate(pathways = sapply(Empirical.Compound, get_pathways, df_1 = DF_1))

# Display the first few rows of the updated merged_data
head(merged_data)

######

# Remove duplicate rows from merged_data
merged_data <- merged_data %>% distinct()

# Specify the output file path and name
output_path <- "C:/Users/Remi/Documents/TAMUCC M.S chemi/Medaka Bone metabolic study/Metaboanalyst_inR/MetabAnalyst_inR/MetaboAnalystR_3_29_24/Table figure 2 and 3/2_finaltable_M3movsF3mo.xlsx"

# Save the merged_data dataframe as an Excel file
write.xlsx(merged_data, file = output_path)

# Confirm the save by printing a message
cat("The dataframe has been saved as an Excel file at the specified path.")
