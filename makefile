prototype: gen/temp/datacompl.csv gen/paper/output/price_superhost.pdf


all: data/data_downloaded.txt gen/paper/output/outputstargazer.htm gen/paper/output/avgprice.pdf gen/paper/output/price_superhost.pdf

##sub-builds
		
data/data_downloaded.txt: src/data_download/data_download.R
		R --vanilla < src/data_download/data_download.R

gen/temp/datacompl.csv: src/data_prep/data_cleaning.R data/data_downloaded.txt
		R --vanilla < src/data_prep/data_cleaning.R

gen/data_prep/output/Curfew_Amsterdam.csv: src/data_prep/dummy_creation.R gen/temp/datacompl.csv
		R --vanilla < src/data_prep/dummy_creation.R

gen/paper/output/outputstargazer.htm: src/data_analysis/data_analysis.R gen/temp/datacompl.csv
		R --vanilla < src/data_analysis/data_analysis.R

gen/paper/output/avgprice.pdf: src/paper/figure1.R gen/data_prep/output/Curfew_Amsterdam.csv
		R --vanilla < src/paper/figure1.R

gen/paper/output/price_superhost.pdf: src/paper/figure2.R gen/data_prep/output/Curfew_Amsterdam.csv
		R --vanilla < src/paper/figure2.R
	
gen/paper/output/price_nbh.pdf: src/paper/Figure3.R gen/data_prep/output/Curfew_Amsterdam.csv
		R --vanilla < src/paper/Figure3.R

