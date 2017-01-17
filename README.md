This repo contains the talks demonstrating specific functionality and also corresponding exercises along with other relevant workshop materials.

# Programme

Time and place is at the Swedish Museum of Natural History on Day 1, January 24, 2017 and Day 2, January 25, 2017.

The afternoons at the end of the two days from 13:00 - 16:30 is planned for *Demonstrations and Exercises* with a *Coffee/Tea* served at 14:30-15:00. This means two blocks of 1.5 h are available on each day...

A suggested programme can therefore be split into dual 45-minute sessions:

## Day 1

- 13:00 - 13:45 * Session 1 *
- 13:45 - 14:30 * Session 2 *
- 14:30 - 15:00 * Coffee/Tea *
- 15:00 - 15:45 * Session 3 *
- 15:45 - 16:30 * Session 4 *

## Day 2

- 13:00 - 13:45 * Session 5 *
- 13:45 - 14:30 * Session 6 *
- 14:30 - 15:00 * Coffee/Tea *
- 15:00 - 15:45 * Session 7 *
- 15:45 - 16:30 * Session 8 *

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

## Exercises & Demonstrations

We could arrange Session 1 first with some Lecture/Demos then Session 2 follows up with Exercises, interleaving demos and exercises for different topics, etc...

### Infrastructure

People attending will have laptops and connectivity to Internet, through Eduroam or credentials we assume that the Museum ISIT department can arrange. 

The tools and various required software is bundled into "Mirroeum" which can be deployed in a server, where users and logins can be pre-created for all the participants. For those who doesn't want to run locally, this could be used. Can be deployed at mirroreum.dina-web.net or some such domain...

Details at: https://github.com/raquamaps/mirroreum/blob/master/eubon-rocker/Dockerfile

I am planning on building up-to-date images based on that, which can be pulled with

	docker pull raquamaps/mirroeum
	docker pull raquamaps/shiny

### Day 1

One idea could be to start Session 1 on the topic of "R for scientific computation and biodiversity analysis using rOpenSci packages" with some demos and lectures / walkthrough of relevant use case on topics recommended/suggested by Scott C, then Session 2 would follow with exercises related to this topic.

Session 3 could be on topic "Ignorance scores for primary biodiversity data" from Alejandro Ruete with some demos. This is followed by session 4 which provides some hands-on exercises using the package and allowing people to work on an exercise involving a concrete use case.

### Day 2

Session 5 could start with a lecture and demo of "Atlas of Living Australia and ALA4R" from Ben R. Then Session 6 would follow with exercises based on using ALA4R in practice.

Session 7 could start with a presentation and lecture based on "speciesgeocodeR and sampbias" from A Zizka. Then Session 8 would follow with hands-on exercises involving use of these tools







