# 1) GET SHINY + TIDYVERSE + AN OPERATING SYSTEM INSTALLED FROM A DOCKER TEMPLATE
FROM rocker/shiny-verse:latest

# 2) INSTALL SYSTEM LIBRARIES ON THE IMAGE (i.e. not R libraries, but Unix)
# Note: Only use one "RUN" command, because it blows out the size enormously. Concatenate with \ or &&
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev && \
# 3) INSTALL R PACKAGES ON THE IMAGE
    R -e "install.packages(c('shiny', 'shinydashboard', 'lubridate', 'magrittr', 'glue', 'DT', 'plotly', 'maps', 'mapproj'), repos='http://cran.rstudio.com/')" \
    R -e "devtools::install_github('andrewsali/shinycssloaders')" 

#4) COPY THE APP TO THE IMAGE  (COPY   from   to)
COPY test_shiny2.Rproj /srv/shiny-server/ 
COPY app.R /srv/shiny-server/
COPY R /srv/shiny-server/R 
COPY data /srv/shiny-server/data 
COPY man /srv/shiny-server/man

# 5) OPEN PORT 3838 IN IMAGE
EXPOSE 3838

# 6) ALLOW PERMISSION
RUN sudo chown -R shiny:shiny /srv/shiny-server

# 7) RUN APP
CMD ["/usr/bin/shiny-server.sh"]