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

df <- all_data %>% select(cols_to_keep)

df <- df %>% filter(df$host_is_superhost != "")

# --- Group id together using arrange function --- #
datacompl <- arrange(df, id)

rm(df,all_data,tmp) ### clean environment

# --- Change name 'last_scraped' & setting it to 'Date' --- #
colnames(datacompl)[which(colnames(datacompl) == 'last_scraped')] <- 'date'
datacompl$date = as.Date(datacompl$date)

# --- Remove the dollar sign and remove rows with price = 0 --- #

datacompl$price = as.numeric(gsub("\\$", "", datacompl$price))

datacompl <- datacompl %>% filter(price > 0)

######### cleaning finished, create new files for next sets of code #########

# --- Create dummy variable for curfew (1 = curfew 0 = no curfew) --- #
datacompl$curfew <- ifelse( datacompl$date > as.Date("2021/01/23", format = "%Y/%m/%d") &
                              datacompl$date < as.Date("2021/04/28", format = "%Y/%m/%d"), 1, 0)

# --- Create dummy variable for type of curfew (from 21:00 or from 22:00) --- #
datacompl$curfew_orig <- ifelse( datacompl$date > as.Date("2021/01/23", format = "%Y/%m/%d") &
                                datacompl$date < as.Date("2021/03/31", format = "%Y/%m/%d"), 1, 0)   # orig -> original curfew from 21:00 till 04:30

datacompl$curfew_short <- ifelse( datacompl$date > as.Date("2021/03/31", format = "%Y/%m/%d") &
                                datacompl$date < as.Date("2021/04/28", format = "%Y/%m/%d"), 1, 0)   # short -> shorter curfew from 22:00 till 04:30

# --- Linear Regression models --- #
m1 <- lm(price ~ 1 + curfew + host_is_superhost, data = datacompl)
m2 <- lm(price ~ 1 + curfew + host_is_superhost + as.factor(neighbourhood_cleansed) ,data = datacompl)

table_m1_m2 <- msummary(list(m1, m2))
table_m1_m2

#--- To check p-values --- #
stargazer(m1, m2, type = 'text')
summary(m1)
summary(m2)
