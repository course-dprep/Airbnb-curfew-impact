# The impact of Corona curfews on the prices of Airbnb listings in Amsterdam

This repository belongs to the research into the impact of Corona curfews on the prices of Airbnb listings in Amsterdam. The research is part of the [Data Preparation and Workflow Management](https://dprep.hannesdatta.com) course at Tilburg University. In this research we answer the following research question:

**Did the curfew affect the prices of Airbnb listings? Zooming in on Amsterdam**

![Airbnb_Amsterdam](https://assets.deondernemer.nl/de-ondernemer/images/news_items/_960x532_crop_center-center_80_none/airbnb_amsterdam_anp.jpg?mtime=20190822123354&focal=none&tmtime=20210505210855)

## Motivation

The Covid-19 pandemic has had a major impact on our society for more than eighteen months now. To reduce the spread of the virus, an intelligent lockdown was introduced in the Netherlands. Face masks were made mandatory in public areas and people had to deal with a very drastic measure: the curfew. In the Netherlands, from January 23rd to April 28th, it was made mandatory to stay indoors between 21:00 and 04:30 (from 31st of March the curfew times changed to 22:00 till 04:30). 

The curfew and other covid restrictions had a massive impact on society, especially [tourism](https://fortune.com/2020/11/16/airbnb-ipo-initial-public-offering-coronavirus-impact/):
- Airbnb lost almost 700 million dollars in the first nine months of 2020, more than the total loss of 2019.
- Airbnb's revenue was 32% lower in 2020 than it was in 2019. 

For this research project we zoom in on Amsterdam, a city that is [heavily reliant on tourism](https://www.cbs.nl/nl-nl/longread/aanvullende-statistische-diensten/2021/toerismerekeningen-gemeente-amsterdam-2017-2019-?onepage=true).

**Why is this research interesting and important?**
- Determining the effect of the curfew on the income of landlords.
- Effects of the neighbourhood on the Airbnb listing price.
- Effects of the host status on the Airbnb listing price.

## Method and Results
### The research method
The research method that is used in this research project is a multiple regression analysis. This type of analysis allows us to check the effect multiple variables have on the Airbnb listing prices in Amsterdam during the Covid-19 period. In our complete model curfew effects, Superhost status and neighbourhood are analysed. By putting these variables in a linear regression we can conclude if these variabes have a significant effect on the listing price of the Airbnb. The output of this model alows us to answer our research question.  

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

### Results
In our Rmarkdown file there are figures and tables shown with the results of our study. The results are as follows:
- It is clear that the curfew had a negative effect on the Airbnb Listing price.
- The effect of the later curfew (22:00) was less dramatic then that of the original curfew (21:00). 
- During the Covid-19 crisis Superhost status had a significant negative effect on the Airbnb listing price.
- There are significant differences between neighbourhoods, which is to be expected. 

## Repository overview

The repository consists of a src folder and Docs folder, followed by the gitignore file and the R project file. 

## Running instructions

- Install [RStudio and R](https://tilburgsciencehub.com/get/r)
- In R, install additional packages by copy/pasting and running the following lines in an R script:

```
install.packages("readr")
install.packages("googledrive")
install.packages("dplyr")
install.packages(“data.table)
install.packages(“stargazer”)
install.packages(“modelsummary”)
```
- The data will be downloaded from Google Drive by running the 'data_download.R' script. To access these data files, you are only required to have a Google Drive account.

Explain to potential users how to run/replicate your workflow. Touch upon, if necessary, the required input data, which (secret) credentials are required (and how to obtain them), which software tools are needed to run the workflow (including links to the installation instructions), and how to run the workflow. Make use of subheaders where appropriate.

## More resources



## Contributors 

This is the repository for the course [Data Preparation and Workflow Management](https://dprep.hannesdatta.com), team project (team 15).

The people who have contributed to this repository are [Tayfun Ozcan](https://github.com/tayfunozcan), [Quinten de Putter](https://github.com/QuintendePutter), [Sam van de Ven](https://github.com/SamvdVen) and [Jeroen Maagdenberg](https://github.com/jeroenmaagdenberg). They are all students of the Master Marketing Analytics at Tilburg University.
