# How I got this to work

I followed a few tutorials.

1) SHINY APP - https://shiny.rstudio.com/tutorial/written-tutorial/lesson5/
**data/counties.rds** was downloaded from the counties.rds download at the top of the page.
**R/helpers.R** was downloaded from the helpers.R section near the top
**app.R** is a copy of Model Answers 2, which is near the bottom. (But you have to push a button to reveal the code)

2) DOCKERFILE 
Dockerfile is a script that tells Docker how to build the image. I've added comments to it to explain what's going on.
I copied mine from
https://juanitorduz.github.io/dockerize-a-shinyapp/

3) OTHER
I created an RProject file in this directory using RStudio.

# How to edit it
If you make changes, you'll need to rebuild the images.

docker build -t test_shiny2 .

# How to run it
docker run --rm -p 3838:3838 test_shiny2

# How to stop it 
Control+P Control+Q Control+C (Do all three)

# Other useful commands
docker ps   (lists running docker instances)
docker stop test_shiny2   (stops the running container called test_shiny2)
docker images   (lists the images saved and ready to run)
