# --- Load Libraries --- #

library(readr)
library(dplyr)
library(stringr)
library(data.table)
library(stargazer)
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

# --- Rename neighbourhood_cleansed and storing it as factor --- #
datacompl <- rename(datacompl, neighbourhood = neighbourhood_cleansed)
datacompl$neighbourhood <- as.factor(datacompl$neighbourhood)

# --- Checking duplicates & checking summary --- #

datacompl <- datacompl %>% filter(!duplicated(datacompl))

summary(datacompl)

######### cleaning finished, make dummies and save as csv file#########


# --- Create dummy variable for curfew (1 = curfew 0 = no curfew) --- #
datacompl$curfew <- ifelse( datacompl$date > as.Date("2021/01/23", format = "%Y/%m/%d") &
                              datacompl$date < as.Date("2021/04/28", format = "%Y/%m/%d"), 1, 0)

# --- Create dummy variable for type of curfew (from 21:00 or from 22:00) --- #
datacompl$curfew_21_00 <- ifelse( datacompl$date > as.Date("2021/01/23", format = "%Y/%m/%d") &
                                datacompl$date < as.Date("2021/03/31", format = "%Y/%m/%d"), 1, 0)   #original curfew from 21:00 till 04:30

datacompl$curfew_22_00 <- ifelse( datacompl$date > as.Date("2021/03/31", format = "%Y/%m/%d") &
                                datacompl$date < as.Date("2021/04/28", format = "%Y/%m/%d"), 1, 0)   #shorter curfew from 22:00 till 04:30


write.csv(datacompl, "data/datacompl.csv", row.names = FALSE)
