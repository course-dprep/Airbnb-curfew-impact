all: src/data_analysis/data_analysis.R src/data_prep/data_cleaning.R src/data_prep/dummy_creation.R src/data_analysis/data_analysis.R

##sub-builds
		
src/data_download/data_download.R: src/data_download/data_download.R
		R --vanilla < src/data_download/data_download.R

gen/temp/datacompl.csv: src/data_prep/data_cleaning.R
		R --vanilla < src/data_prep/data_cleaning.R

gen/data_prep/output/Curfew_Amsterdam.csv: src/data_prep/dummy_creation.R
		R --vanilla < src/data_prep/dummy_creation.R


gen/paper/output/test_output.pdf: src/data_analysis/data_analysis.R
		R --vanilla < src/data_analysis/data_analysis.R

# makefile works but you need to have the data downloaded. 