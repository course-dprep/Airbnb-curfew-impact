# --- Load Libraries --- #
library(readr)
library(googledrive)

# --- Create Directory --- #
dir.create(("data"), showWarnings = FALSE) #creating folder on local machine

# --- Download data --- #
downloads <- list(
    c(id = "1tDtmLxH6XwlTu9svStQRzk7ccEjwA9l9", period = 'aug2020'),
    c(id = "1-nS3tzFpoHdsCZH9wHFcjP9o-_dxKpJE", period = 'sep2020'),
    c(id = "1OiGuMc2NlmMqnIUfwSxPK8ro6tDvhPee", period = 'oct2020'),
    c(id = "10QeqkNrZjgSQGCAT4rOP9NMY7P7lA_6q", period = 'nov2020'),
    c(id = "1SgMdGDJ8wBqGdTjmBkUfvGqGGYG4bSYJ", period = 'dec2020'),
    c(id = "11a5kVji75PnckMyX-7sh47ETEAXnU9Bv", period = 'jan2021'),
    c(id = "19LaoXLHoKTKBI2PdqUIXqgR6cRPjvIYB", period = 'feb2021'),
    c(id = "1RGrGAzX6FkgnHtUsD48v-0NwIHDDZfh4", period = 'mar2021'),
    c(id = "1GV1d8CegjMZTQ7sEhDmX2EQnKrDFuF0h", period = 'apr2021'),
    c(id = "1MKF3vQq9B-a3Aa9rbKIxcApOTw13rqIi", period = 'may2021'),
    c(id = "1HAv7ibe01Lm-2D1l5A0Uzh9w_JaHqJmx", period = 'jun2021'),
    c(id = "1MYQR3pe68ZsnDHqtPmgsClbJAhxyntTP", period = 'jul2021'),
    c(id = "1xRa3NPLvkWR1RggqGe6KsuYn6BKZNB80", period = 'aug2021'))

for (file in downloads) {drive_download(as_id(file['id']),path = paste0('data/period_', file['period'], '.csv'),overwrite = TRUE)}

#Data stored in Data folder when this code runs 
