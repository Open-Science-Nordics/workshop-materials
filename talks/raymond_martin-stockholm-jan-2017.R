## ALA4R examples
## For the course "R in biodiversity informatics: rOpenSci for all"
## Stockholm, Sweden, January 2017
## Ben Raymond, alaben@untan.gl


library(ALA4R)
library(dplyr)
library(tidyr)

## set the cache directory
ala_config(cache_directory="~/temp/cache/ala/")

## -----
## Example 1: Taxonomic trees

sx <- search_fulltext("cormorants")
sx

## download the taxonomic information
tx <- taxinfo_download("rk_family:PHALACROCORACIDAE")

## keep only species and subspecies records
tx <- tx %>% filter(rank %in% c("species","subspecies")) %>%
    select(guid,genus,scientificName,rank)

## plot taxonomic tree
library(ape)
library(phytools)
tx <- tx %>% mutate_all(as.factor)
ax <- as.phylo(~genus/scientificName,data=tx)
plotTree(ax,type="fan",fsize=0.7)


## with images
## first get species profiles
s <- search_guids(tx$guid)

## download thumbnail from each and cache it
imfiles <- sapply(s$thumbnailUrl,
                  function(z) ifelse(!is.na(z),ALA4R:::cached_get(z,type="binary_filename"),"")
                  )

## plot tree without labels
plotTree(ax,type="fan",ftype="off")
## get the tree plot object
tr <- get("last_plot.phylo",envir = .PlotPhyloEnv)
## add each image
library(jpeg)
for (k in which(nzchar(imfiles)))
    rasterImage(readJPEG(imfiles[k]),tr$xx[k]-1/10,tr$yy[k]-1/10,tr$xx[k]+1/10,tr$yy[k]+1/10)

## -----
## Example 2: species list

## for region of interest, create WKT string using your favourite method, e.g.
library(wellknown)
## e.g. Tasmania
poly <- list(type="Polygon",
             coordinates=list(list(c(144.5,-43.6),c(148.5,-43.6),c(148.5,-40.5),c(144.5,-40.5),c(144.5,-43.6))))
wkt <- geojson2wkt(poly)

## now use that WKT string to extract species in this region that have conservation status
x <- specieslist(wkt=wkt,fq="state_conservation:*")
x %>% arrange(desc(occurrenceCount)) %>% select(speciesName,commonName) %>% head(10)


## -----
## Example 3: working with occurrences

## see ALA4R::occurrences() function
## add extra fields (e.g. environmental data) via the fields or extra parameters
## method="offline" supports unlimited download size and more fields (but is slower)
## note similar functionality with ropensci's spocc package (but no fields, and smaller download limit)

## define region of interest (Adelaide to Sydney)
wkt <- "POLYGON((152.5 -35,152.5 -32,138.5 -32,138.5 -35,152.5 -35))"
## define some environmental layers of interest [see ala_fields()]
env_layers <- c("Precipitation - annual","Temperature - annual max mean")
## get the data
x <- occurrences(taxon="family:Fabaceae",wkt=wkt,qa="none",download_reason_id=10,extra=env_layers)

temp <- x$data %>%
    ## discard genus- and higher-level records
    filter(rank %in% c("species","subspecies","variety","form","cultivar")) %>%
    ## bin into 0.5-degree bins
    mutate(longitude=round(longitude*2)/2,latitude=round(latitude*2)/2) %>%
    ## average environmental vars within each bin
    group_by(longitude,latitude) %>% mutate(precipitationAnnual = mean(precipitationAnnual,na.rm=TRUE),temperatureAnnualMaxMean = mean(temperatureAnnualMaxMean,na.rm=TRUE)) %>%
    ## subset to vars of interest
    select(longitude,latitude,scientificName,precipitationAnnual,temperatureAnnualMaxMean) %>%
    ## take one row per cell per species (presence)
    unique() %>%
    ## calculate species richness
    mutate(richness=n()) %>%
    ## convert to wide format (sites by species)
    mutate(present=1) %>% do(spread(data=.,key=scientificName,value=present,fill=0)) %>% ungroup()

# where a species was not present, it will have NA
# convert these to 0
sppcols <- setdiff(names(temp),c("longitude","latitude","precipitationAnnual","temperatureAnnualMaxMean","richness"))
for (k in sppcols) temp[is.na(temp[,k]),k] <- 0

## end result:
temp

## species richness as a function of longitude:
library(ggplot2)
ggplot(temp,aes(longitude,richness))+geom_point()+theme_bw()

## species richness as a function of environment:
ggplot(temp,aes(temperatureAnnualMaxMean,precipitationAnnual,colour=richness))+geom_point(size=8)+theme_bw()

##cluster sites together based on their species:
library(vegan)
# dissimilarity between all pairs of sites
D <- vegdist(temp[,sppcols],"bray")

# UPGMA clustering
cl <- hclust(D,method="ave")

# plot the dendrogram
plot(cl)


## extract group labels at the 20-group level:
grp <- cutree(cl,20)
## this gives a lot of groups with only a small number of sites – coalesce these outliers together into a single new group
sing <- which(table(grp)<5)
# put these in a new combined group
grp[grp %in% sing] <- 21
# renumber groups
temp$group <- sapply(grp,function(z) which(unique(grp)==z))


## plot using leaflet:
## define a colour palette
cmap <- c("#1f77b4","#ff7f0e","#2ca02c","#d62728","#9467bd","#8c564b","#e377c2","#7f7f7f","#bcbd22","#17becf")

## define popups to give info about each grid cell
temp$popup <- apply(temp[,setdiff(names(temp),sppcols)],1,function(z)knitr::kable(z,format="html"))


## construct rectangles representing the 0.5-degree bins
r <- temp %>%
  select(longitude,latitude,popup,group) %>%
  mutate(colour=cmap[group],lon_min=longitude-0.25,lon_max=longitude+0.25,lat_min=latitude-0.25,lat_max=latitude+0.25)

## finally construct the leaflet map
library(leaflet)
leaflet() %>% addTiles() %>% addRectangles(r$lon_min,r$lat_min,r$lon_max,r$lat_max,color=r$colour,popup=r$popup)

