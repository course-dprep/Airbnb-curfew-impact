#Figure 3: Development price in different neighbourhoods

#grouping data together per month
Curfew_Amsterdam_plots <- Curfew_Amsterdam
Curfew_Amsterdam_plots$date <- format(Curfew_Amsterdam_plots$date, "%Y/%m")

Curfew_Amsterdam_plots %>% 
  ggplot(aes(x = date, y = price, group = neighbourhood, color = neighbourhood)) +
  geom_smooth(se = FALSE)

ggsave("gen/paper/output/price_nbh.pdf") #not sure about this graph
