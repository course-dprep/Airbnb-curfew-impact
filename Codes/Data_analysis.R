#regression and analysis ideas price is dependent variable 

# curfew 21:00 vs 22:00 
# effect neighbourhoods on the airbnb prices
# effect of being super host on the price
# complete model analysis 
# plot to see price development as general first plot / historgram also possible here
# anova testing for neighbourhoods, curfew/ 

# packages
library(ggplot2)
library(ggfortify)
library(broom)
library(dplyr)
library(readr)
library(stargazer)
library(modelsummary)

# --- loading curfew data ---#
Curfew_Amsterdam <- read_csv("./data/Curfew_Amsterdam.csv")
Curfew_Amsterdam <- read_csv("./data/datacompl.csv") # take this one out when github has been updated 


# --- Draft graphs --- #

#Development of the mean price of a room in Amsterdam over the 13 month period
#grouping data together per month
Curfew_Amsterdam_plots <- Curfew_Amsterdam
Curfew_Amsterdam_plots$date <- format(Curfew_Amsterdam_plots$date, "%Y/%m")

ggplot(data, aes(date, price, group = "date")) + geom_smooth() #works -- remove

Curfew_Amsterdam_plots %>% 
  ggplot(aes(x = date, y = price, group = "date")) + 
  geom_smooth(color = 'black', se = FALSE) +
  labs(x = "Date in months", y = "Price ($)") +
  ggtitle("Figure 1: Airbnb Listing Prices in Amsterdam from August 2020 till August 2021") +
  theme_bw() #how to adjust 7_scale without messing up graph

class(Curfew_Amsterdam$host_is_superhost)
#! graph needs to be adjusted on the y axis, change x axis dates to month written --> Aug 2020, Sep 2020

#Development of the mean price of a room in Amsterdam superhost or not

Curfew_Amsterdam_plots %>% 
  ggplot(aes(x = date, y = price, group = host_is_superhost, color = host_is_superhost)) +
  geom_smooth(se = FALSE) +
  labs(x = "Date", y = "Price ($)") +
  ggtitle("Figure 2: Airbnbn Listing Prices for Superhost and Normal Hosts") +
  theme_bw() +
  scale_color_manual(values = c("green", "orange")) #change title here but got error message 


#Development of the price in different neighbourhoods --> one graph preferred 




# --- Linear Regression models --- #

# --- Checking effect curfew and smaller curfew window --- #
m1 <- lm(price ~ 1 + curfew + host_is_superhost, data = Curfew_Amsterdam)
m2 <- lm(price ~ 1 + curfew_2100 + curfew_2200 + host_is_superhost, data = Curfew_Amsterdam)
m3 <- lm(price ~ 1 + curfew_2100 + curfew_2200 + host_is_superhost + neighbourhood, data = Curfew_Amsterdam)

table_m1_m2_m3 <- msummary(list(m1, m2, m3))
table_m1_m2_m3

# Checking model assumptions
autoplot(
  m3,
  which = 1:3,
  nrow = 1,
  ncol = 3)

#fig1 data points should center around the horizontal axis
#fig2 second requirement is that the residuals are approximately normally distributed
#fig3 check here if there is any pattern that stands out
#volgens ons kloppen alle 3 de reqs

# outliers screening

pot_outliers <- m3 %>%
  augment() %>%
  select(price, curfew_2100, curfew_2200, host_is_superhost, neighbourhood, leverage = .hat, cooks_dist = .cooksd) %>%
  arrange(desc(cooks_dist)) %>%
  head()
pot_outliers

#very low values, no outliers in data

# check p-values
stargazer(m1, m2, m3,
          title = "Figure 1: Curfew effect on Airbnb Prices",
          dep.var.caption = "Airbnb Pricing",
          dep.var.labels = "",
          covariate.labels = c("Curfew", "22:00 Curfew", "Superhost"),
          column.labels = c("Original Curfew", "Later Curfew"),
          notes.label = "Significance levels",
          type = 'text') 

stargazer(m1, m2, m3, type = 'text')  # not sure about model