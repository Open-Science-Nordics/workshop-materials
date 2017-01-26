This repo contains the talks demonstrating specific functionality and also corresponding exercises along with other relevant workshop materials.

# Programme

Time and place is at the Swedish Museum of Natural History on Day 1, January 24, 2017 and Day 2, January 25, 2017.

# Content and Topics

## Audience

For the workshop we have approximately one third of the people attending representing a couple of companies (Kamishi AB - a mix of computational biology and financial markets focus, Greensway AB - appears to be a consultancy providing qualified Ecology planning services, Öresundsfonden - protects the Baltic Sea, competence in the unique marine environment there).

The rest of the participants stems from various European public sector educational institutions (Stockholm University, Swedish Museum of Natural History, Lund University, Royal Botanic Gardens Kew, Jagiellonian University). It seems that the following topics may be of interest to this audience:

- Medicinal Plant Names used in virtual herbaria
- Botanical Phylogeny - modern ways to build botanical taxonomies
- Swedish Bird Survey - bird population size and distribution and long term trends, bird recoveries
- Investigating primary succession on freshly deglaciated Arctic areas involving particularly lichens and bryophytes
- Evidence based conservation and quantifying trends in butterfly abundance using TRIM indices 
- Choropleth graphs based on ArcGIS shapefile for fish populations 

The participants are PhD students, postdocs and senior scientists who want to build their skills in using R to analyze biodiversity data. We may expect that a fair number of students are relatively inexperienced in using R, so we need to cater to their needs both by helping them prepare for the course and by covering some suitable [introductory material](introduction) at the start of the course. 

## Presenters

Presentations are primarily by:

- Scott Chamberlain, ROpenSci
- Ben Raymond, [ACE CRC](http://acecrc.org.au/)
- Alejandro Ruete, [Swedish University of Agricultural Sciences](http://www.slu.se/en/)
- Markus Skyttner, Swedish Museum of Natural History
- Alexander Zizka, Gothenburg University

## Topics to be presented

- R for scientific computation and biodiversity analysis
- rOpenSci and R packages for biodiversity analysis
- Ignorance scores for primary biodiversity data
- Mirroreum and EU-BON R packages
- Atlas of Living Australia and ALA4R
	- a brief overview of the ALA and the full APIs
	- the ALA4R package and the API subset that it covers
	- some use case examples
- speciesgeocodeR and sampbias R packages

## Repository

Please put any materials relating to demonstrations and exercises here:

https://github.com/Open-Science-Nordics/workshop-materials

## Afternoon Exercises & Demonstrations

The afternoons at the end of the two days from 13:00 - 16:30 is planned for *Demonstrations and Exercises* with a *Coffee/Tea* served at 14:30-15:00. This means two blocks of 1.5 h are available on each day...

## Day 1

- 08:30 - 09:00 Registration
- 09:00 - 09:10 Welcome
- 09:10 - 09:40 Talk: **R for scientific computation and biodiversity analysis** Markus Skyttner
- 09:40 - 10:30 Talk: **rOpenSci and R packages for biodiversity analysis** Scott Chamberlain
- 10:30 - 11:00 Coffee/Sandwich
- 11:00 - 12:00 Talk: **Ignorance scores for primary biodiversity data** Alejandro Ruete

- 12:00 - 13:00 Lunch at Restaurant Fossilen

- 13:00 - 13:45 Session: **Introduction to R - data manipulation with dplyr and tidyr**
- 13:45 - 14:30 Session: **Using R and rOpenSci-packages - some exercises**
- 14:30 - 15:00 Coffee/Tea
- 15:00 - 15:20 Session: **Data Handling Tutorial - How to rasterize primary biodiversity data**
- 15:20 - 15:45 Session: **Creating a simple R data package - swedishbutterflies**
- 15:45 - 16:30 Session: **Questions and Answers - BRING YOUR OWN questions to the table**

## Day 2

- 09:00 - 09:30 Talk: **Mirroreum and EU-BON R packages** Markus Skyttner
- 09:30 - 10:30 Talk: **Atlas of Living Australia and ALA4R** David Martin and Ben Raymond
- 10:30 - 11:00 Coffee/Sandwich
- 11:00 - 12:00 Talk: **speciesgeocodeR and sampbias** Alexander Zizka

- 12:00 - 13:00 Lunch at Restaurant Fossilen

- 13:00 - 13:45 Session: **Exercises and demos - getting data using ALA4R and getting data from Web APIs**
- 13:45 - 14:30 Session: **Packages with Swedish bird data - swedishbirdrecoveries and swedishbirdtrends**
- 14:30 - 15:00 Coffee/Tea
- 15:00 - 15:20 Session: **Exercises related to "speciesgeocodeR and sampbias: Dealing with coordinate errors and sampling biases in biodiversity data"**
- 15:20 - 16:30 Session: **Questions and Answers - BRING YOUR OWN questions to the table**
 
### Infrastructure

People attending will have laptops and connectivity to Internet, through Eduroam or credentials we assume that the Museum ISIT department can arrange. 

The tools and various required software is bundled into "Mirroeum" which can be deployed in a server, where users and logins can be pre-created for all the participants. For those who doesn't want to run locally, this could be used. Can be deployed at mirroreum.dina-web.net or some such domain...

Details at: https://github.com/raquamaps/mirroreum/blob/master/eubon-rocker/Dockerfile

Images based on that Dockerfile can be pulled with:

	docker pull raquamaps/mirroreum:v0
	#docker pull raquamaps/shiny:v0

You can (get and) run the image with:

	# get and start the service on port 8787
	docker run -d -p 8787:8787 raquamaps/mirroreum:v0

	# log in with rstudio/rstudio
	firefox http://localhost:8787

You can read more docs at https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image#running-rstudio-server


# Feedback 

If you have attended this event, please make sure to fill out this quick survey with your feedback:

[Survey for feedback on "rOpenSci for all" workshop in Stockholm Jan 24th-25th 2017](https://www.surveymonkey.com/r/DV35GBX)

# Resources / Links

- ROpenSci - "Fostering open science and open data with R" at https://ropensci.github.io/ambassador-packet/slides/#ropensci
- Some challenges in doing reproducible research at https://ropensci.org/blog/2014/06/09/reproducibility/
- Nordic Open Science materials from Finland at http://openscience.fi/initiatives

- https://cdn.rawgit.com/Open-Science-Nordics/workshop-materials/e26657a9/exercises/speciesgeocoder_sampbias/speciesgeocodeR_coordinate_cleaning_exercise.html

