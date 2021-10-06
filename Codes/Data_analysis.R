# --- Linear Regression models --- #
m1 <- lm(price ~ 1 + curfew + host_is_superhost, data = datacompl)
m2 <- lm(price ~ 1 + curfew + host_is_superhost + as.factor(neighbourhood) ,data = datacompl)

table_m1_m2 <- msummary(list(m1, m2))
table_m1_m2

#--- To check p-values --- #
stargazer(m1, m2, type = 'text')
summary(m1)
summary(m2)


#regression ideas --> what do we need