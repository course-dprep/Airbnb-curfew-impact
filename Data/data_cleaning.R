# --- Load Libraries --- #
library(readr)
library(dplyr)
library(stringr)
library(data.table)
library(stargazer)

# --- Load data in R Environment --- #
files = list.files('Data', pattern = 'csv', full.names = T)

# --- Load all datasets in one list --- #
tmp <- lapply(files, fread)
all_data <- rbindlist(tmp)

# ---  Select relevant columns, getting rid of missing values --- #
df2 <-
  all_data %>% select(
    c(
      'id',
      'last_scraped',
      'host_id',
      'host_is_superhost',
      'neighbourhood_cleansed',
      'price'
    )
  )

df2 <- na.omit(df)


# --- Group id together using arrange function --- #
datacompl <- arrange(df2, id)

# --- Change name 'last_scraped' & setting it to 'Date' --- #
colnames(datacompl)[which(colnames(datacompl) == 'last_scraped')] <-
  'date'
datacompl$date = as.Date(datacompl$date)

# --- Create dummy variable curfew (1 = curfew 0 = no curfew) --- #
datacompl$curfew <-
  ifelse(
    datacompl$date > as.Date("2021/01/23", format = "%Y/%m/%d") &
      datacompl$date < as.Date("2021/04/28", format = "%Y/%m/%d"),
    1,
    0
  )

# --- Remove rows with price = 0 --- #
datacompl$price = as.numeric(gsub("\\$", "", datacompl$price))

datacompl2 <- datacompl %>% filter(price > 0)

# --- Linear Regression models --- #
m1 <- lm(price ~ 1 + curfew + host_is_superhost, data = datacompl2)
m2_nbh <-
  lm(price ~ 1 + curfew + host_is_superhost + as.factor(neighbourhood_cleansed) ,
     data = datacompl2)

table_m1_m2_nbh <- msummary(list(m1, m2))
table_m1_m2_nbh

#--- To check p-values --- #
stargazer(m1, m2_nbh, type = 'text')
summary(m1)
summary(m2_nbh)
