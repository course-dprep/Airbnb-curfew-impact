# --- Load Libraries --- #

library(dplyr)

# --- Cleaning data --- #

Curfew<- rbind(january_2021,february_2021,march_2021, april_2021, may_2021)

Curfew_cleaned <- Curfew %>% select('id','last_scraped', 'price', 'host_is_superhost', 'neighbourhood_cleansed')
