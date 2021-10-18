# The impact of Corona curfews on the prices of Airbnb listings in Amsterdam

This repository belongs to the research into the impact of Corona curfews on the prices of Airbnb listings in Amsterdam. The research is part of the [Data Preparation and Workflow Management](https://dprep.hannesdatta.com) course at Tilburg University. In this research we answer the following research question:

**Did the curfew affect the prices of Airbnb listings? Zooming in on Amsterdam**

![Airbnb_Amsterdam](https://assets.deondernemer.nl/de-ondernemer/images/news_items/_960x532_crop_center-center_80_none/airbnb_amsterdam_anp.jpg?mtime=20190822123354&focal=none&tmtime=20210505210855)

## Motivation

The Covid-19 pandemic has had a major impact on our society for more than eighteen months now. To reduce the spread of the virus, an intelligent lockdown was introduced in the Netherlands. Face masks were made mandatory in public areas and people had to deal with a very drastic measure: the curfew. In the Netherlands, from January 23rd to April 28th, it was made mandatory to stay indoors between 21:00 and 04:30 (from 31st of March the curfew times changed to 22:00 till 04:30). 

The curfew and other covid restrictions had a massive impact on society, especially [tourism](https://fortune.com/2020/11/16/airbnb-ipo-initial-public-offering-coronavirus-impact/):
- Airbnb lost almost 700 million dollars in the first nine months of 2020, more than the total loss of 2019.
- Airbnb's revenue was 32% lower in 2020 than it was in 2019. 

For this research project, we zoom in on Amsterdam, a city that is [heavily reliant on tourism](https://www.cbs.nl/nl-nl/longread/aanvullende-statistische-diensten/2021/toerismerekeningen-gemeente-amsterdam-2017-2019-?onepage=true).

**Why is this research interesting and important?**
- Determining the effect of the curfew on the income of landlords.
- Effects of the neighbourhood on the Airbnb listing price.
- Effects of the host status on the Airbnb listing price.

## Method and Results
### The research method
The research method that is used in this research project is a multiple regression analysis. This type of analysis allows us to check the effect multiple variables have on the Airbnb listing prices in Amsterdam during the Covid-19 period. In our complete model curfew effects, Superhost status and neighbourhood are analysed. By putting these variables in a linear regression model we can conclude if these variables have a significant effect on the price of the Airbnb listing. The output of this model allows us to answer our research question.  

### Data collection and preparation
The data used for this research was gathered from the website [Inside Airbnb](http://insideairbnb.com/get-the-data.html). The effect of the curfew in Amsterdam will be investigated on the dates from August  2020 to August 2021. Therefore, the datasets including these time samples for Amsterdam are available for download in the data_download.R file. After downloading the data, it will be prepared for the research:
- Merging the datasets into one aggregated dataset
- Deleting columns that are abundant for this research project
- Getting rid of missing values
- Setting variables to the correct type
- Creating dummy variables for the curfew times, to check whether the datapoint was or was not during the curfew period

After all the cleaning and creating the dummy variables the dataset used for this research will be named as Curfew_Amsterdam in the data file, ready for conducting a study.

The model of this research:
- DV: ‘price’
- IV: ‘curfew’
- MOD: ‘host_is_superhost’ and ‘neighbourhood_cleansed’

### Conclusion
In the Rmarkdown file, the results of this research are discussed. Here are some final concluding remarks:
- It is clear that the curfew had a negative effect on the Airbnb listing price.
- The introduction of the later curfew (22:00) did offset this by a substantial amount.
- During the Covid-19 crisis, superhost status had a significant negative effect on the Airbnb listing price.
- There are significant differences in prices between neighbourhoods.


## Repository overview

The various files and folders in this Github repository will be explained in this section.

- The source ("src") folder includes the data scripts that are needed to download, clean, analyse and create the figures.
- Want to run "src" automatically? That's possible! Open the makefile and type "make" in the command prompt.
- Doing so creates two extra directories namely: "data" and "gen".
- The "gen" folder has two sub-directories "temp" and "paper". 
- In the "docs" file you find the Rmarkdown file, which includes figures and tables build in the analyse part.
- The ".Gitignore" file lists files and filetypes that don't need to be uploaded to GitHub. 
- The ".Rproj" file includes the settings and options of this project.
- Finally, this repository contains a "Readme" file which you are reading now. It contains info about the project, authors, packages etc.

## Running instructions

- Install [RStudio and R](https://tilburgsciencehub.com/get/r)
- Install [Make](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/)
- In R, install additional packages by copy/pasting and running the following lines in an R script:

```
install.packages("readr")
install.packages("googledrive")
install.packages("dplyr")
install.packages("stringr")
install.packages("data.table")
install.packages("stargazer")
install.packages("modelsummary")
install.packages("ggplot2")
install.packages("ggfortify")
install.packages("broom")
install.packages("foreign")
install.packages("tidyverse")
install.packages("knitr")
```
- The data for this research will be downloaded from Google Drive. To access these data files, you are only required to have a Google Drive account.

- Run the 'makefile' first, this will generate the output of this research. 
- Afterwards, run 'Markdown.Rmd' in the 'docs' folder to generate an html document that contains figures and a table derived from the data. 

## Resources
If one is looking for more information regarding other variables that might influence Airbnb pricing, it is recommended to see the following article:
- Chattopadhyay, M., & Mitra, S. (2019). Do Airbnb host listing attributes influence room pricing homogenously?. International Journal Of Hospitality Management, 81, 54-64. doi: [10.1016/j.ijhm.2019.03.008](https://www-sciencedirect-com.tilburguniversity.idm.oclc.org/science/article/pii/S0278431918308491)

This article provides a solid overview of past research done towards the determinants of Airbnb pricing and the authors investigate a couple more listing variables that might affect the Airbnb listing price. 

The articles below discuss host status in more detail and the effect it has on pricing, which might be interesting since we found a negative effect for Superhost status on Airbnb listing prices:

- Ert, E., & Fleischer, A. (2019). The evolution of trust in Airbnb: A case of home rental. Annals Of Tourism Research, 75, 279-287. doi: [10.1016/j.annals.2019.01.004](https://tilburguniversity.idm.oclc.org/login?url=https://www.sciencedirect.com/science/article/abs/pii/S0160738319300040)
- Liang, S., Schuckert, M., Law, R., & Chen, C. (2017). Be a “Superhost”: The importance of badge systems for peer-to-peer rental accommodations. Tourism Management, 60, 454-465. doi: [10.1016/j.tourman.2017.01.007](https://tilburguniversity.idm.oclc.org/login?url=https://www.sciencedirect.com/science/article/abs/pii/S0261517717300079)


## Contributors 

This is the repository for the course [Data Preparation and Workflow Management](https://dprep.hannesdatta.com), team project (team 15).

The people who have contributed to this repository are [Tayfun Ozcan](https://github.com/tayfunozcan), [Quinten de Putter](https://github.com/QuintendePutter), [Sam van de Ven](https://github.com/SamvdVen) and [Jeroen Maagdenberg](https://github.com/jeroenmaagdenberg). They are all students of the Master Marketing Analytics at Tilburg University.
