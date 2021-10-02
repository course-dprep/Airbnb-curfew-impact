# --- Load Libraries --- #

library(readr)
library(googledrive)

# --- Download data --- #

files = list('https://drive.google.com/file/d/1tDtmLxH6XwlTu9svStQRzk7ccEjwA9l9/view?usp=sharing',
             'https://drive.google.com/file/d/1-nS3tzFpoHdsCZH9wHFcjP9o-_dxKpJE/view?usp=sharing',
             'https://drive.google.com/file/d/1OiGuMc2NlmMqnIUfwSxPK8ro6tDvhPee/view?usp=sharing',
             'https://drive.google.com/file/d/10QeqkNrZjgSQGCAT4rOP9NMY7P7lA_6q/view?usp=sharing',
             'https://drive.google.com/file/d/1SgMdGDJ8wBqGdTjmBkUfvGqGGYG4bSYJ/view?usp=sharing',
             'https://drive.google.com/file/d/11a5kVji75PnckMyX-7sh47ETEAXnU9Bv/view?usp=sharing',
             'https://drive.google.com/file/d/19LaoXLHoKTKBI2PdqUIXqgR6cRPjvIYB/view?usp=sharing',
             'https://drive.google.com/file/d/1RGrGAzX6FkgnHtUsD48v-0NwIHDDZfh4/view?usp=sharing',
             'https://drive.google.com/file/d/1GV1d8CegjMZTQ7sEhDmX2EQnKrDFuF0h/view?usp=sharing',
             'https://drive.google.com/file/d/1MKF3vQq9B-a3Aa9rbKIxcApOTw13rqIi/view?usp=sharing',
             'https://drive.google.com/file/d/1HAv7ibe01Lm-2D1l5A0Uzh9w_JaHqJmx/view?usp=sharing',
             'https://drive.google.com/file/d/1MYQR3pe68ZsnDHqtPmgsClbJAhxyntTP/view?usp=sharing',
             'https://drive.google.com/file/d/1xRa3NPLvkWR1RggqGe6KsuYn6BKZNB80/view?usp=sharing')

for(f in files) {
  cat(paste0('downloading file: ', f )) 
  drive_download(file = f, overwrite = TRUE)
}