#Figure 2 Development of the mean price of a room in Amsterdam Super host or not

#Load Library
library(ggplot2)
library(foreign)
library(readr)
library(tidyverse)

Curfew_Amsterdam <- read_csv("gen/temp/Curfew_Amsterdam.csv") 

#grouping data together per month

Curfew_Amsterdam_plots <- Curfew_Amsterdam
Curfew_Amsterdam_plots$date <- format(Curfew_Amsterdam_plots$date, "%Y/%m")

Curfew_Amsterdam_plots %>% 
  ggplot(aes(x = date, y = price, group = host_is_superhost, color = host_is_superhost)) +
  geom_smooth(se = FALSE) +
  expand_limits(y = c(140,160)) +
  labs(x = "Date", y = "Price ($)",
       title = "Figure 2: Airbnb Listing Prices for Super Host and Normal host status",
       subtitle = "From August 2020 till August 2021",) +
  theme_dark() +
  scale_color_manual(values = c("green", "orange")) 
ggsave("gen/paper/price_superhost.pdf")

