all: data/data_downloaded.txt gen/temp/datacompl.csv gen/temp/Curfew_Amsterdam.csv gen/paper/avgprice.pdf gen/paper/price_superhost.pdf gen/paper/stargazer.htm

##sub-builds
		
data/data_downloaded.txt: src/data_download/data_download.R
		R --vanilla < src/data_download/data_download.R

gen/temp/datacompl.csv: src/data_prep/data_cleaning.R data/data_downloaded.txt
		mkdir -p gen/temp
		R --vanilla < src/data_prep/data_cleaning.R

gen/temp/Curfew_Amsterdam.csv: src/data_prep/dummy_creation.R gen/temp/datacompl.csv
		R --vanilla < src/data_prep/dummy_creation.R
		
gen/paper/avgprice.pdf: src/paper/figure1.R gen/temp/Curfew_Amsterdam.csv
		mkdir -p gen/paper
		R --vanilla < src/paper/figure1.R
		
gen/paper/price_superhost.pdf: src/paper/figure2.R gen/temp/Curfew_Amsterdam.csv
		R --vanilla < src/paper/figure2.R
		
gen/paper/stargazer.htm: src/Data_analysis/Data_analysis.R gen/temp/Curfew_Amsterdam.csv
		R --vanilla < src/Data_analysis/Data_analysis.R
