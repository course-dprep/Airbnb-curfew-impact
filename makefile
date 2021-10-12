prototype: gen/temp/datacompl.csv


all: data/data_downloaded.txt

##sub-builds
		
data/data_downloaded.txt: src/data_download/data_download.R
		R --vanilla < src/data_download/data_download.R

gen/temp/datacompl.csv: src/data_prep/data_cleaning.R data/data_downloaded.txt
		R --vanilla < src/data_prep/data_cleaning.R

gen/data_prep/output/Curfew_Amsterdam.csv: src/data_prep/dummy_creation.R gen/temp/datacompl.csv
		R --vanilla < src/data_prep/dummy_creation.R


gen/paper/output/test_output.pdf: src/data_analysis/data_analysis.R
		R --vanilla < src/data_analysis/data_analysis.R