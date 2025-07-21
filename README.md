# Air Quality In NYC - SQL Project Case Study

# Overview

Showcasing my ability to work with large and complex datasets. This project shows working with PostgreSQL to import a csv dataset, create the structure and relationships between fact and dimension tables, and turn the data into actionable and understandable insights to answer real-world questions.

# Purpose

Air pollution is one of the most important environmental threats to urban populations and while all people are exposed, pollutant emissions, levels of exposure, and population vulnerability vary across neighborhoods. Exposures to common air pollutants have been linked to respiratory and cardiovascular diseases, cancers, and premature deaths. These indicators provide a perspective across time and NYC geographies to better characterize air quality and health in NYC.

# Data Structure

Basic data structure includes the raw data and a dim table that provides a summary of the different geographical types for further understanding of the areas being measured in the numeric outputs.

# Tasks Performed

Data Exploration and Validation - Performed general data exploration and validation checks of the air_quality dataset with 19,000 rows of data.

Dimension Table Set Up - Analyzed columns to break out into dimension tables or any that required further explanation. I found that most columns did not need to be broken out because the raw data was concise on column structure, but the one column that needed further explanation was the geo_type_name column. The data dictionary for this dataset mentioned some abbreviations and provided a brief summary on what each of the geography types were in New York City specifically, so in order to get the most out of this dataset for the end user, a dimension table was created with the summaries of each of those types. Someone who works with air quality data in NYC consistently and directly would understand these geographic types, but in this case the view is being customized to any individual who may or may not know (like I originally didn’t as someone who does not live in NYC or know much about air quality measurements) what the different geographic types are in measuring air quality.

# Queries and Views for Real-World Questions

There are plenty of directions to go with this dataset based on the needs of the end user, but in this case, I decided to move forward with some general questions such as counts and sums of the data value in the different geographic areas, but also more specific questions based on the geography type, geography place, time period, and indicator types. I also found some interesting information in running ultra-specific queries out of my own curiosity working with this dataset. Below are the questions I wanted to ask to understand how this dataset works more in depth.

1. What measurements are done the most for air quality? 
- mcg/m3 for fine particles (6,345)
- ppb for NO2 (6,345)
- ppb for O3 (2,115)
2. What is the top 10 mcg/m3 annual average for each geography type for fine particles?
- Between 12.96 - 16.09
3. How many annual measurements were there in the Bronx done for the measure of “per 100,000 children”?
- 15 total measurements done
- 3 between 2005-2007, 3 between 2009-2011, 3 between 2012-2014, 3 between 2015-2017, 3 between 2017-2019
4. What is the count of air quality measurements done for each Annual Average?
- 282 measurements for each year from 2009- to 2023
5. What is the average of the mean mcg/m3 between Winter and Summer? Is there much of a difference?
- Summer: 9.43
- Winter: 9.40

From this exploration, I better understand the dataset and how the column structure correlate, and I wanted to hone in on the different geographic areas, specifically for children with asthma and how they are affected by the Ozone (O3) versus fine particles (PM 2.5), and how fine particles have changed in each Borough of NYC since 2010 to 2023.

1. For the UHF42 geographical type, how many recorded times were there instances due to asthma hospitalizations per 100,000 children due to Ozone versus PM 2.5
- Ozone: 23,677 per 42,000,000 children
- PM 2.5: 18,480 per 21,000,000 children - more due to PM 2.5 versus Ozone
2. For each Borough, what is the difference in fine particles (PM 2.5) from 2010 to 2023 and the percent change
- Bronx: 12.12 > 9.29 - 30.46% decrease
- Brooklyn: 11.96 > 8.78 - 36.22% decrease - 3rd largest decrease and second lowest fine particles value in 2023
- Manhattan: 13.41 > 9.34 - 43.58% decrease
- Queens: 11.53 > 8.79 - 31.17% decrease
- Staten Island: 11.43 > 8.38 - 36.40% decrease

# Summary

From this exploration, if I were someone who was trying to find the best borough to live in New York City for a child with asthma, I would choose Brooklyn. My reasoning would be because the factor that causes more life threatening hospitalizations for asthmatic children is fine particles, and the borough that has not only one of the lowest fine particles but also has the largest decrease over the last 13 years is Brooklyn, meaning there could be steps being taken by Brooklyn city planning and management to help better air quality compared to other areas in New York City. 

Of course, this is just a hypothesis. To truly understand the best areas for asthmatic children to live in NYC, there are factors such as accessible healthcare, steps being taken by the community, a good indoor environment, second-hand smoke exposure, pollen and green spaces, and other socioeconomic and stress factors. In this case, primarily based on air quality, Brooklyn would be the best area to start looking based on this dataset and the analysis done in this project.
