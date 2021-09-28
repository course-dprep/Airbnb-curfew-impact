# --- Load Libraries --- #

library(readr)
library(googledrive)

# --- Info --- #

data_id <- "https://drive.google.com/file/d/15q_h7kxCjSudjmHpXU-mDYQnBHujIIbF/view?usp=sharing"
out_file <- "data/DataAirbnb.RData"  
drive_download(
  as_id(data_id), 
  path = out_file, 
  overwrite = TRUE)

CurfewData <- load("data/DataAirbnb.RData")