#Figure 1 Development mean price of a room in Amsterdam over the 13 month period

#load library
library(ggplot2)
library(foreign)
library(readr)
library(tidyverse)

Curfew_Amsterdam <- read_csv("gen/temp/Curfew_Amsterdam.csv") 

#grouping data together per month
Curfew_Amsterdam_plots <- Curfew_Amsterdam
Curfew_Amsterdam_plots$date <- format(Curfew_Amsterdam_plots$date, "%Y/%m")

Curfew_Amsterdam_plots %>% 
  ggplot(aes(x = date, y = price, group = "date")) + 
  geom_smooth(color = 'black', se = FALSE) +
  expand_limits(y = c(145,160)) +
  labs(x = "Date in months", y = "Price ($)",
       title = "Figure 1: Average Airbnb Listing Price in Amsterdam",
       subtitle = "From August 2020 till August 2021") +
  theme_bw()
ggsave("gen/paper/avgprice.pdf")


