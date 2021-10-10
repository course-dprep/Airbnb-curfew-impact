Curfew_Amsterdam.csv: data_cleaning.R
		R --vanilla <data_cleaning.R ### works after changing terminal to codes folder


period_aug2020.csv period_sep2020.csv period_oct2020.csv period_nov2020.csv period_dec2020.csv period_jan2021.csv period_feb2021.csv period_mar2021.csv period_apr2021.csv period_may2021.csv period_jun2021.csv period_jul2021.csv period_aug2021.csv: data_download.R
		R --vanilla < data_download.R
		
downloads: data_download.R
		R --vanilla < data_download.R
		
