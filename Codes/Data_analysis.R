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

# --- loading curfew data ---#
Curfew_Amsterdam <- read_csv("./data/Curfew_Amsterdam.csv")
Curfew_Amsterdam <- read_csv("./data/datacompl.csv") # take this one out when github has been updated 


# --- Linear Regression models --- #

# --- Checking effect curfew and smaller curfew window --- #
m1 <- lm(price ~ 1 + curfew + host_is_superhost, data = Curfew_Amsterdam)
m2 <- lm(price ~ 1 + curfew + curfew_22_00 + host_is_superhost, data = Curfew_Amsterdam)
m3 <- lm(price ~ 1 + curfew_21_00 + curfew_22_00 + host_is_superhost, data = Curfew_Amsterdam) # good model?

# Checking model assumptions?
# Independent observations
# Variance equal (homoscedasticity)
# residual normally distributed (normality)


table_m1_m2 <- msummary(list(m1, m2))
table_m1_m2
# check p-values

stargazer(m1, m2, 
          title = "Figure 1: Curfew effect on Airbnb Prices",
          dep.var.caption = "Airbnb Pricing",
          dep.var.labels = "",
          covariate.labels = c("Curfew", "22:00 Curfew", "Superhost"),
          column.labels = c("Original Curfew", "Later Curfew"),
          notes.label = "Significance levels",
          type = 'text') 

stargazer(m1, m2, m3, type = 'text')  # not sure about model

# --- Checking neighbourhood effects --- #
m4 <- lm(price ~ 1 + curfew + host_is_superhost + neighbourhood, data = Curfew_Amsterdam)
table_m1_m4 <- msummary(list(m1, m4))

# check p-values
stargazer(m1, m4, type = 'text')

