# --- Load Libraries --- #

library(readr)
library(dplyr)

# --- Load data in R Environment --- #

aug2020 <- read_csv("Data/period_aug2020.csv")
sep2020 <- read_csv("Data/period_sep2020.csv")
oct2020 <- read_csv("Data/period_oct2020.csv")
nov2020 <- read_csv("Data/period_nov2020.csv")
dec2020 <- read_csv("Data/period_dec2020.csv")
jan2021 <- read_csv("Data/period_jan2021.csv")
feb2021 <- read_csv("Data/period_feb2021.csv")
mar2021 <- read_csv("Data/period_mar2021.csv")
apr2021 <- read_csv("Data/period_apr2021.csv")
may2021 <- read_csv("Data/period_may2021.csv")
jun2021 <- read_csv("Data/period_jun2021.csv")
jul2021 <- read_csv("Data/period_jul2021.csv")
aug2021 <- read_csv("Data/period_aug2021.csv")

# loads in with 74 variabes, need to select variables that are needed.
# clean out datasheets first, merge afterwards 
# Variabes needed: id, last_scraped, price, host_is_superhost, neighbourhood



datacompl %>% filter(host_id == 3159) ######## not sure what this does @quinten ???????????



## Selecting relevant columns, getting rid of others and get rid of missing values. 

cols_to_keep = c('id', 'last_scraped', 'host_id', 'host_is_superhost',
                 'neighbourhood_cleansed', 'price')


aug2020 <- na.omit(aug2020[, which(colnames(aug2020)%in%cols_to_keep)])
sep2020 <- na.omit(sep2020[, which(colnames(sep2020)%in%cols_to_keep)])
oct2020 <- na.omit(oct2020[, which(colnames(oct2020)%in%cols_to_keep)])
nov2020 <- na.omit(nov2020[, which(colnames(nov2020)%in%cols_to_keep)])
dec2020 <- na.omit(dec2020[, which(colnames(dec2020)%in%cols_to_keep)])
jan2021 <- na.omit(jan2021[, which(colnames(jan2021)%in%cols_to_keep)])
feb2021 <- na.omit(feb2021[, which(colnames(feb2021)%in%cols_to_keep)])
mar2021 <- na.omit(mar2021[, which(colnames(mar2021)%in%cols_to_keep)])
apr2021 <- na.omit(apr2021[, which(colnames(apr2021)%in%cols_to_keep)])
may2021 <- na.omit(may2021[, which(colnames(may2021)%in%cols_to_keep)])
jun2021 <- na.omit(jun2021[, which(colnames(jun2021)%in%cols_to_keep)])
jul2021 <- na.omit(jul2021[, which(colnames(jul2021)%in%cols_to_keep)])
aug2021 <- na.omit(aug2021[, which(colnames(aug2021)%in%cols_to_keep)])

rm(cols_to_keep)

# combining datasets

datacompl <- rbind(aug2020, sep2020, oct2020, nov2020, dec2020,
                   jan2021, feb2021, mar2021, apr2021, may2021,
                   jun2021, jul2021, aug2021)


#clean environment
rm(aug2020, sep2020, oct2020, nov2020, dec2020, jan2021,
   feb2021, mar2021, apr2021, may2021, jun2021, jul2021, aug2021)


#grouping id together using arrange function
datacompl <- arrange(datacompl, id)

#changing name 'last_scraped' & setting it to 'Date'

colnames(datacompl)[which(colnames(datacompl)=='last_scraped')] <- 'date'
datacompl$date = as.Date(datacompl$date)

#adding dummy variable Curfew
##### work in progress
