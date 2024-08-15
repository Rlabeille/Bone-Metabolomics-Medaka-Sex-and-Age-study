# Install and load the readxl package if you haven't already

library(readxl)

library(dplyr)
library(openxlsx)
# Set the file path
file_path <- "C:/Users/Remi/Documents/TAMUCC M.S chemi/Medaka Bone metabolic study/Metaboanalyst_inR/MetabAnalyst_inR/MetaboAnalystR_3_29_24/Table figure 2 and 3/F8movsF3mo_msms_EC_stats_pathways.xlsx"

# Read the Excel file into a dataframe
F8movsF3mo_msms_EC_stats_pathways <- read_excel(file_path)

# Display the first few rows of the dataframe
head(F8movsF3mo_msms_EC_stats_pathways)



# Order the dataframe by p.value and t.score
F8movsF3mo_msms_EC_stats_pathways <- F8movsF3mo_msms_EC_stats_pathways %>%
  arrange(p.value, t.score)

# Display the first few rows of the sorted dataframe
head(F8movsF3mo_msms_EC_stats_pathways)

### ordering basesd on absolute t.score and statistically sig p.values"


# Read the Excel file
df <- read_excel(file_path)

# Filter out rows where p.value is > 0.05 and Matched.Compound is "NA"
df_filtered <- df %>%
  filter(p.value <= 0.05, Matched.Compound != "NA")

# Sort by the absolute value of t.score in descending order and select the top 10 rows
top10_df <- df_filtered %>%
  arrange(desc(abs(t.score))) %>%
  head(50)

# Write the resulting data frame to a new Excel file
write.xlsx(top10_df, "C:/Users/Remi/Documents/TAMUCC M.S chemi/Medaka Bone metabolic study/Metaboanalyst_inR/MetabAnalyst_inR/MetaboAnalystR_3_29_24/Table figure 2 and 3/Top10_F8movsF3mo_msms_EC_stats_pathways.xlsx")