#creating dummy variables
library(readr)
library(dplyr)
library(stringr)

#dataset
datacompl <- read_csv("gen/temp/datacompl.csv")

# --- Create dummy variable for curfew (1 = curfew 0 = no curfew) --- #
datacompl$curfew <- ifelse( datacompl$date > as.Date("2021/01/23", format = "%Y/%m/%d") &
                              datacompl$date < as.Date("2021/04/28", format = "%Y/%m/%d"), 1, 0)

# --- Create dummy variable for type of curfew (from 21:00 or from 22:00) --- #
datacompl$curfew_2100 <- ifelse( datacompl$date > as.Date("2021/01/23", format = "%Y/%m/%d") &
                                   datacompl$date < as.Date("2021/03/31", format = "%Y/%m/%d"), 1, 0)   

datacompl$curfew_2200 <- ifelse( datacompl$date > as.Date("2021/03/31", format = "%Y/%m/%d") &
                                   datacompl$date < as.Date("2021/04/28", format = "%Y/%m/%d"), 1, 0)   

Curfew_Amsterdam <- datacompl
rm(datacompl)

# --- Store as csv file --- #
write.csv(Curfew_Amsterdam, "gen/temp/Curfew_Amsterdam.csv", row.names = FALSE) 