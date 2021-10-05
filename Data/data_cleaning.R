# --- Load Libraries --- #

library(readr)
library(dplyr)
library(stringr)
library(data.table)

# --- Load data in R Environment --- #

files = list.files('Data', pattern='csv', full.names=T)

# (excursion to data.table)
tmp <- lapply(files, fread)
all_data <- rbindlist(tmp)

# convert back to tidyr
all_data <- tibble(all_data)

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

datacompl$curfew <- ifelse(datacompl$date > as.Date("2021/01/23", format = "%Y/%m/%d") &
                      datacompl$date < as.Date("2021/04/28", format = "%Y/%m/%d"), 1, 0)

#### dummy for neighbourhoods

table(datacompl$neighbourhood_cleansed)

#Bijlmer-centrum is base value

datacompl$nbh_BijlmerOost <- ifelse(datacompl$neighbourhood_cleansed == "Bijlmer-Oost", 1, 0)
datacompl$nbh_BosLommer <- ifelse(datacompl$neighbourhood_cleansed == "Bos en Lommer", 1, 0)
datacompl$nbh_Buitenveldert <- ifelse(datacompl$neighbourhood_cleansed == "Buitenveldert - Zuidas", 1, 0)
datacompl$nbh_CentrumOost <- ifelse(datacompl$neighbourhood_cleansed == "Centrum-Oost", 1, 0)
datacompl$nbh_CentrumWest <- ifelse(datacompl$neighbourhood_cleansed == "Centrum-West", 1, 0)
datacompl$nbh_DeAker <- ifelse(datacompl$neighbourhood_cleansed == "De Aker - Nieuw Sloten", 1, 0)
datacompl$nbh_Baarsjes <- ifelse(datacompl$neighbourhood_cleansed == "De Baarsjes - Oud-West", 1, 0)
datacompl$nbh_DePijp <- ifelse(datacompl$neighbourhood_cleansed == "De Pijp - Rivierenbuurt", 1, 0)
datacompl$nbh_Gaasperdam <- ifelse(datacompl$neighbourhood_cleansed == "Gaasperdam - Driemond", 1, 0)
datacompl$nbh_Geuzenveld <- ifelse(datacompl$neighbourhood_cleansed == "Geuzenveld - Slotermeer", 1, 0)
datacompl$nbh_IJburg <- ifelse(datacompl$neighbourhood_cleansed == "IJburg - Zeeburgereiland", 1, 0)
datacompl$nbh_NoordOost <- ifelse(datacompl$neighbourhood_cleansed == "Noord-Oost", 1, 0)
datacompl$nbh_NoordWest <- ifelse(datacompl$neighbourhood_cleansed == "Noord-West", 1, 0)
datacompl$nbh_OostHavengebied <- ifelse(datacompl$neighbourhood_cleansed == "Oostelijk Havengebied - Indische Buurt", 1, 0)
datacompl$nbh_Osdorp <- ifelse(datacompl$neighbourhood_cleansed == "Osdorp", 1, 0)
datacompl$nbh_OudNoord <- ifelse(datacompl$neighbourhood_cleansed == "Oud-Noord", 1, 0)
datacompl$nbh_OudOost <- ifelse(datacompl$neighbourhood_cleansed == "Oud-Oost", 1, 0)
datacompl$nbh_Slotervaart <- ifelse(datacompl$neighbourhood_cleansed == "Slotervaart", 1, 0)
datacompl$nbh_Watergraafsmeer <- ifelse(datacompl$neighbourhood_cleansed == "Watergraafsmeer", 1, 0)
datacompl$nbh_Westerpark <- ifelse(datacompl$neighbourhood_cleansed == "Westerpark", 1, 0)
datacompl$nbh_Zuid <- ifelse(datacompl$neighbourhood_cleansed == "Zuid", 1, 0)

#getting rid of price = 0

str_replace(data2$price, '$', '')
datacompl <- parse_number(datacompl$price)
datacompl$price = as.numeric(gsub("\\$", "", datacompl$price)) 

library(stargazer)
m1 <- lm(price ~ 1 + curfew + host_is_superhost, data = datacompl)
m2 <- lm(price ~ 1 + curfew + host_is_superhost + as.factor(neighbourhood_cleansed) , data = datacompl)

stargazer(m1,m2, type='text')


