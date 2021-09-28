library(readr)
library(readr)
may_2021<- read_csv("~/Downloads/listings-7.csv")

Curfew<- rbind(january_2021,february_2021,march_2021, april_2021, may_2021)

Curfew_cleaned <- Curfew %>% select('id','last_scraped', 'price', 'host_is_superhost', 'neighbourhood_cleansed') %>% 
  arrange(desc(mdy(Curfew_cleaned$last_scraped)))