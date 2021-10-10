#figures


#load library
library(ggplot2)
library(foreign)
library(readr)

Curfew_Amsterdam <- read_csv("./gen/data_prep/output/Curfew_Amsterdam.csv") ## remove before deadline


#Development of the mean price of a room in Amsterdam over the 13 month period
#grouping data together per month
Curfew_Amsterdam_plots <- Curfew_Amsterdam
Curfew_Amsterdam_plots$date <- format(Curfew_Amsterdam_plots$date, "%Y/%m")

Curfew_Amsterdam_plots %>% 
  ggplot(aes(x = date, y = price, group = "date")) + 
  geom_smooth(color = 'black', se = FALSE) +
  labs(x = "Date in months", y = "Price ($)",
       title = "Figure 1: Average Airbnb Listing Price in Amsterdam",
       subtitle = "From August 2020 till August 2021") +
  theme_bw()
#how to adjust y_scale without messing up graph
#! graph needs to be adjusted on the y axis, change x axis dates to month written --> Aug 2020, Sep 2020

#Development of the mean price of a room in Amsterdam superhost or not

Curfew_Amsterdam_plots %>% 
  ggplot(aes(x = date, y = price, group = host_is_superhost, color = host_is_superhost)) +
  geom_smooth(se = FALSE) +
  labs(x = "Date", y = "Price ($)",
       title = "Figure 2: Airbnb Listing Prices for Super Host and Normal host status",
       subtitle = "From August 2020 till August 2021",) +
  theme_dark() +
  scale_color_manual(values = c("green", "orange")) #change title here but ran into an error message 



#Development of the price in different neighbourhoods --> one graph preferred 

Curfew_Amsterdam_plots %>% 
  ggplot(aes(x = date, y = price, group = neighbourhood, color = neighbourhood)) + #not sure about this graph in particular, looks messy
  geom_smooth(se = FALSE) 