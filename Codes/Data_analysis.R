#regression and analysis ideas price is dependent variable 

# curfew 21:00 vs 22:00 
# effect neighbourhoods on the airbnb prices
# effect of being super host on the price
# complete model analysis 
# plot to see price development as general first plot / historgram also possible here

# packages
library(ggplot2)
library(ggfortify)
library(broom)
library(dplyr)

# --- basic plotting of price development troughout this 13 month time period --- #
ggplot(data = Curfew_Amsterdam, aes(date, price)) # need to continue with this one 


# --- Linear Regression models --- #
m1 <- lm(price ~ 1 + curfew + host_is_superhost, data = Curfew_Amsterdam)
m2 <- lm(price ~ 1 + curfew + host_is_superhost + neighbourhood ,data = Curfew_Amsterdam)
m3 <- lm(price ~ 1 + curfew + curfew_22_00, data = Curfew_Amsterdam)

table_m1_m2 <- msummary(list(m1, m2))
table_m1_m2

#--- To check p-values --- #
stargazer(m1, m2, type = 'text')
summary(m1)
summary(m2)

#difference Curfew effects
table_m1_m3 <- msummary(list(m1, m3))
stargazer(m1, m3, type = 'text') #lijkt wel een boeiend effect, verdere analyze op los laten?

