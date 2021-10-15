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

#--- Create dummy variable for neighbourhood ---#
datacompl$bijlmer_centrum <- ifelse( datacompl$neighbourhood == 'Bijlmer-Centrum', 1, 0)
datacompl$bijlmer_oost <- ifelse( datacompl$neighbourhood == 'Bijlmer-Oost', 1, 0)
datacompl$bos_en_lommer <- ifelse( datacompl$neighbourhood == 'Bos en Lommer', 1, 0)
datacompl$buitenveldert_zuidas <- ifelse( datacompl$neighbourhood == 'Buitenveldert - Zuidas', 1, 0)
datacompl$centrum_oost <- ifelse( datacompl$neighbourhood == 'Centrum-Oost', 1, 0)
datacompl$centrum_west <- ifelse( datacompl$neighbourhood == 'Centrum-West', 1, 0)
datacompl$de_aker_nieuw_sloten <- ifelse( datacompl$neighbourhood == 'De Aker - Nieuw Sloten', 1, 0)
datacompl$de_baarsjes_oud_west <- ifelse( datacompl$neighbourhood == 'De Baarsjes - Oud-West', 1, 0)
datacompl$de_pijp_rivierenbuurt <- ifelse( datacompl$neighbourhood == 'De Pijp - Rivierenbuurt', 1, 0)
datacompl$gaasperdam_driemond <- ifelse( datacompl$neighbourhood == 'Gaasperdam - Driemond', 1, 0)
datacompl$geuzenveld_slotermeer <- ifelse( datacompl$neighbourhood == 'Geuzenveld - Slotermeer', 1, 0)
datacompl$ijburg_zeeburgereiland <- ifelse( datacompl$neighbourhood == 'IJburg - Zeeburgereiland', 1, 0)
datacompl$noord_oost <- ifelse( datacompl$neighbourhood == 'Noord-Oost', 1, 0)
datacompl$noord_west <- ifelse( datacompl$neighbourhood == 'Noord-West', 1, 0)
datacompl$oostelijk_havengebied_indische_buurt <- ifelse( datacompl$neighbourhood == 'Oostelijk Havengebied - Indische Buurt', 1, 0)
datacompl$osdorp <- ifelse( datacompl$neighbourhood == 'Osdorp', 1, 0)
datacompl$oud_noord <- ifelse( datacompl$neighbourhood == 'Oud-Noord', 1, 0)
datacompl$oud_oost <- ifelse( datacompl$neighbourhood == 'Oud-Oost', 1, 0)
datacompl$slotervaart <- ifelse( datacompl$neighbourhood == 'Slotervaart', 1, 0)
datacompl$watergraafsmeer <- ifelse( datacompl$neighbourhood == 'Watergraafsmeer', 1, 0)
datacompl$westerpark <- ifelse( datacompl$neighbourhood == 'Westerpark', 1, 0)
datacompl$zuid <- ifelse( datacompl$neighbourhood == 'Zuid', 1, 0)

#--- Recoding host_is_superhost to dummy ---#
datacompl$superhost <- ifelse( datacompl$host_is_superhost == 't', 1,0)

#--- Rename dataset and remove dataset with old name ---#
Curfew_Amsterdam <- datacompl
rm(datacompl)

# --- Store as csv file --- #
write.csv(Curfew_Amsterdam, "gen/temp/Curfew_Amsterdam.csv", row.names = FALSE) 