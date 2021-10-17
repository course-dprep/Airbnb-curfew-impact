#regression and analysis ideas price is dependent variable 

# packages
library(ggplot2)
library(ggfortify)
library(broom)
library(dplyr)
library(readr)
library(stargazer)
library(modelsummary)


# --- loading curfew data ---#
Curfew_Amsterdam <- read_csv("gen/temp/Curfew_Amsterdam.csv")

# --- Linear Regression models --- #

# --- Checking effect curfew and smaller curfew window --- #
m1 <- lm(price ~ 1 + curfew + host_is_superhost, data = Curfew_Amsterdam)
m2 <- lm(price ~ 1 + curfew + curfew_2200 + host_is_superhost, data = Curfew_Amsterdam)
m3 <- lm(price ~ 1 + curfew + curfew_2200 + host_is_superhost + neighbourhood, data = Curfew_Amsterdam)

table_m1_m2_m3 <- stargazer(list(m1, m2, m3, type='text')) 
table_m1_m2_m3

#--- Log regression ---#
m1log <- lm(log1p(price) ~ 1 + curfew + host_is_superhost, data = Curfew_Amsterdam)
m2log <- lm(log1p(price) ~ 1 + curfew + curfew_2200 + host_is_superhost, data = Curfew_Amsterdam)
m3log <- lm(log1p(price) ~ 1 + curfew + curfew_2200 + host_is_superhost + neighbourhood, data = Curfew_Amsterdam)

table_log_m1_m2_m3 <- stargazer(list(m1log, m2log, m3log, type='text')) 
table_log_m1_m2_m3

# Checking model assumptions
autoplot(m3,which = 1:3,nrow = 1,ncol = 3) 
ap <- autoplot(m3,which = 1:3,nrow = 1,ncol = 3) # ap stands for autoplot

#fig1 data points should center around the horizontal axis
#fig2 second requirement is that the residuals are approximately normally distributed
#fig3 check here if there is any pattern that stands out
#the data meets all three requirements    

# outliers screening

pot_outliers <- m3 %>%
  augment() %>%
  select(price, curfew, curfew_2200, host_is_superhost, neighbourhood, leverage = .hat, cooks_dist = .cooksd) %>%
  arrange(desc(cooks_dist)) %>%
  head()
pot_outliers

#very low values, no outliers in data

#Model output

stargazer(m1log, m2log, m3log,
          title = "Impact curfew on Airbnb in Amsterdam",
          dep.var.caption = "DV: Price of listing",
          notes.label = "Significance levels",
          covariate.labels = c(
            "Curfew",
            "Curfew 22:00",
            "Host is Superhost",
            "Bijlmer Oost",
            "Bos en Lommer",
            "Buitenveldert Zuidas",
            "Centrum Oost",
            "Centrum West",
            "De Aker Nieuwe Sloten",
            "De Baarsjes Oud West",
            "De Pijp Rivierenbuurt",
            "Gaasperdam Driemond",
            "Geuzenveld Slotermeer",
            "IJburg Zeeburgereiland",
            "Noord Oost",
            "Noord West",
            "Oostelijk Havengebied Indische Buurt",
            "Osdorp",
            "Oud Noord",
            "Oud Oost",
            "Slotervaart",
            "Watergraafsmeer",
            "Westerpark",
            "Zuid",
            "Constant"),
          type = 'html',out = "gen/paper/stargazer.htm")
