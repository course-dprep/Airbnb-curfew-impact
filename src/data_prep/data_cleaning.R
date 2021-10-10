# --- Load Libraries --- #

library(readr)
library(dplyr)
library(stringr)
library(data.table)
library(modelsummary)

# --- Load data in R Environment --- #

files = list.files('Data', pattern = 'csv', full.names = T)

# --- Load all datasets in one list --- #

tmp <- lapply(files, fread)
all_data <- rbindlist(tmp)

all_data <- tibble(all_data)

# ---  Select relevant columns, getting rid of missing values --- #

cols_to_keep = c('id', 'last_scraped', 'host_id', 'host_is_superhost','neighbourhood_cleansed', 'price')
datacompl <- na.omit(all_data[, which(colnames(all_data)%in%cols_to_keep)]) %>% filter(all_data$host_is_superhost != "")

# --- Group id together using arrange function --- #
datacompl <- arrange(datacompl, id)

rm(all_data,tmp, cols_to_keep, files) ### clean environment

# --- Change name 'last_scraped' to 'date' and change variable type to 'Date' --- #
colnames(datacompl)[which(colnames(datacompl) == 'last_scraped')] <- 'date'
datacompl$date = as.Date(datacompl$date)

# --- Remove the dollar sign and remove rows with price = 0 --- #

datacompl$price = as.numeric(gsub("\\$", "", datacompl$price))
datacompl <- datacompl %>% filter(price > 0)

# --- Rename 'neighbourhood_cleansed' to 'neighbourhood' and storing it as factor --- #
datacompl <- rename(datacompl, neighbourhood = neighbourhood_cleansed)
datacompl$neighbourhood <- as.factor(datacompl$neighbourhood)

# --- Checking duplicates & checking summary --- #

datacompl <- datacompl %>% filter(!duplicated(datacompl))
summary(datacompl)

######### cleaning finished, save as csv file#########

dir.create(("gen"), showWarnings = FALSE)
dir.create(("gen/temp"), showWarnings = FALSE)
write.csv(datacompl, "gen/temp/datacompl.csv", row.names = FALSE)