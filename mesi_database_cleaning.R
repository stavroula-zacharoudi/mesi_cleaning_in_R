# Load libraries 
library(dplyr)

######## Download MESI database ######
# Download it from: https://zenodo.org/records/10423853

########Data logger############ #change it according to your path
setwd("D:\\Files\\mesi-db-v1.0.3\\data")

####### load dataset #########
mesi_main <- read.csv("mesi_main.csv")

####### Filter the dataset ####### 
mesi_main_clean <- mesi_main %>%
  filter(
    ecosystem_type == "forest",
    response %in% c("litterfall", "soc"),   # to filter multiple responses
    grepl("_000$", npk)   # regex to match values ending with "_000"
  ) %>%
  select(-c(c_t, d_t, d_t2, n_t, p_t, w_t2, w_t3, x_t, sd_t, se_t, rep_t ))   # drop unwanted columns from the mesi_main

#######  Save the filtered dataset ####### 
write.csv(mesi_main_clean, "mesi_main_clean.csv", row.names = FALSE)

####### save the R data (=workspace) #### #change it according to your path
save.image("D:/Files/mesi-db-v1.0.3/mesi_database.RData")

####### load R data ######### #change it according to your path
load("D:/Files/mesi-db-v1.0.3/mesi_database.RData")

