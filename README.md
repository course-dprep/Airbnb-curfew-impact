# The impact of Corona curfews on the prices of Airbnb listings in Amsterdam

This repository belongs to the research into the impact of Corona curfews on the prices of Airbnb listings in Amsterdam. The research is part of the [Data Preparation and Workflow Management](https://dprep.hannesdatta.com) course at Tilburg University. In this research we answer the following research question:

**Did the curfew affect prices of Airbnb listings? Zooming in on Amsterdam**

## Motivation

The Covid-19 pandemic has had a major impact on our society for more than eighteen months now. To reduce the spread of the virus, an intelligent lockdown was introduced in the Netherlands. Face masks were made mandatory in public areas and people had to deal with a very drastic measure: the curfew. In the Netherlands, from January 23rd to April 28th, it was made mandatory to stay indoors between 21:00 and 04:30 (from 31st of March the curfew times changed to 22:00 till 04:30). 

The curfew and other covid restrictions had a massive impact on society, especially tourism:
- Airbnb lost [almost 700 million dollars](https://fortune.com/2020/11/16/airbnb-ipo-initial-public-offering-coronavirus-impact/) in the first nine months of 2020, more than the total loss of 2019.
- Airbnb's revenue was 32% lower in 2020 than it was in 2019. 

For this research project we zoom in on Amsterdam. A city that heavily reliant on tourism [CBS](https://www.cbs.nl/nl-nl/longread/aanvullende-statistische-diensten/2021/toerismerekeningen-gemeente-amsterdam-2017-2019-?onepage=true).

**Why is this research interesting and important?**
- Determining the effect of the curfew on the income of landlords.
- Effects of the neighbourhood on the Airbnb listing.
- Effects of the host status on the Airbnb listing.

## Method and results

First, introduce and motivate your chosen method, and explain how it contributes to solving the research question/business problem.

Second, summarize your results concisely. Make use of subheaders where appropriate.

## Data collection and preparation

The data used for this research was gathered from the website [Inside Airbnb](http://insideairbnb.com/get-the-data.html). The effect of the curfew in Amsterdam will be investigated on the dates from August  2020 to August 2021. Therefore, the datasets including these time samples for Amsterdam are available for download in the data_download.R file. After downloading the data, it will be prepared for the research. First, the twelve datasets will be merged into one big dataset. After, a new dummy variable called ‘curfew’ will be created, to check whether the datapoint was or was not during the curfew. The model of this research:
•	IV: ‘curfew’
•	DV: ‘price’
•	MOD: ‘host_is_superhost’ and ‘neighbourhood_cleansed’

In addition, the variables from the original dataset which are not included in the research will be removed during the cleaning process to make the dataset easier to read. After all the cleaning the dataset used for this research will be named as Curfew_Amsterdam in the data_cleaning.R file, ready for conducting a study.

## Repository overview

Provide an overview of the directory structure and files.

## Running instructions

- Install [RStudio and R](https://tilburgsciencehub.com/get/r)
- Install additional packages

```
install.packages(eventstudies)
```

Explain to potential users how to run/replicate your workflow. Touch upon, if necessary, the required input data, which (secret) credentials are required (and how to obtain them), which software tools are needed to run the workflow (including links to the installation instructions), and how to run the workflow. Make use of subheaders where appropriate.

## More resources

Point interested users to any related literature and/or documentation.

## Contributors 

This is the repository for the course [Data Preparation and Workflow Management](https://dprep.hannesdatta.com), team project (team 15).

The people who have contributed to this repository are [Tayfun Ozcan](https://github.com/tayfunozcan), [Quinten de Putter](https://github.com/QuintendePutter), Sam van de Ven and [Jeroen Maagdenberg](https://github.com/jeroenmaagdenberg). They are all students of the Master Marketing Analytics at Tilburg University.
