
<!-- README.md is generated from README.Rmd. Please edit that file -->
Intro to Biodiversity Analysis with R
=====================================

There is plenty of great materials available online describing how to get started with R.

Here are some great learning resources (book format):

-   <http://r4ds.had.co.nz/>
-   <http://adv-r.had.co.nz/>
-   <http://r-pkgs.had.co.nz/>
-   <https://bookdown.org/yihui/bookdown/>
-   <https://bookdown.org/> - various other great materials are published here

Here are some great other learning resources (webinars):

-   <https://www.rstudio.com/resources/webinars/> - follow the track "The Essentials of Data Science"

Have a look at these resources for accessing data:

-   <https://github.com/rstudio/webinars/tree/master/15-RStudio-essentials>
-   <https://github.com/rstudio/webinars/tree/master/23-Importing-Data-into-R>
-   <https://github.com/rstudio/webinars/tree/master/05-Data-Wrangling-with-R-and-RStudio>
-   <https://github.com/rstudio/webinars/tree/master/30-Web-APIs>
-   <https://github.com/rstudio/webinars/tree/master/31-Web-APIs>
-   <https://github.com/rstudio/webinars/tree/master/32-Web-Scraping>

... and these for authoring content:

-   <https://github.com/rstudio/webinars/tree/master/12-Getting-started-with-R-Markdown>
-   <https://github.com/rstudio/webinars/tree/master/25-Notebooks>
-   <https://github.com/rstudio/webinars/tree/master/24-bookdown>

Three ways to get necessary software
------------------------------------

The simplest approach for getting everything is to log in with your credentials to:

-   <https://mirroeum.dina-web.net>

You can also install everything you need on your laptop. This involves several steps, including:

-   Installing R, see <https://cran.rstudio.com/> - the section for Download and Install R
-   Installing RStudio, see <https://www.rstudio.com/products/rstudio/download/>
-   Install various ROpenSci and other relevant packages that are needed, see <https://ropensci.org/packages/>

The third option is to use Docker, which give you all of the above in one fell swoop, but then you first need to install:

-   Docker
-   Perhaps also "docker-compose" (not strictly required)

Set it up then issue this command to install and run full package (the download is approx 5G including the OS and everything else):

    docker pull raquamaps/mirroreum
    docker run --name ride -d -p 8787:8787 raquamaps/mirroreum
    # details: https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image

Suggested starting points for exercises
---------------------------------------

After looking at the resources suggested above, have you learned yet how to ...

-   Write a simple markdown document?
-   Write a function in R?
-   Combine two datasets using tidyr and dplyr?
-   Write an advanced function? (see <http://adv-r.had.co.nz/Functions.html>)
