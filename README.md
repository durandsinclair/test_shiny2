# test_shiny2

This project is a demonstration of how to turn a Shiny app into a Docker container.

The step we need to do are:

1. Prepare the Shiny app
In this case, I simply downloaded a Shiny app from RStudio at https://shiny.rstudio.com/tutorial/written-tutorial/lesson5/

2. Add a Dockerfile
A Dockerfile is a recipe for making a Docker "image", which can be instantiated into a Docker container.
Save the file (as "Dockerfile", without an extension)
An explanation of how to create one can be found here: https://environments.rstudio.com/docker
Your Dockerfile can reference either the project on your local computer, or a github repo.

3. Turn the Dockerfile into an image
The command for this at the terminal is:
* $  docker build --tag=<what_you_want_to_name_the_project>
eg
* $   docker build --tag=friendlyhello:v0.0.1
Now check the image was built
* $ docker images ls 
This lists the images, and you should be able to see your tagged image

4. Turn your image into a container
The command for this at the terminal is:
* $ docker run -p <port_number_of_host>:<port_number_of_container> <name_of_image>
eg
* $ docker run -p 4000:80 friendlyhello
Now check the image works (method 1)
* $ docker container ls
Now let's see the image in real life, by opening a browser and going to
* localhost:<port_number_of_host>
eg
* localhost:4000
or
* http://0.0.0.0:4000
Stop the container running by typing
* $ docker container stop <container_id:eg_1fa4ab2cf395>

5. Share the image to Dockerhub so it can be accessed by AWS Fargate
Log into Dockerhub
* $  docker login
Tag the image so it can be uploaded with username/name:tag
My username on dockerhub is "durands". If you have a company, it might be "com.mycompany"
* $ docker tag <name_of_image_on_your_computer> <name_you_want_to_call_image_on_dockerhub>
eg
* $ docker tag friendlyhello durands/get-started:part2
Check it tagged properly
* $ docker image ls
Publish to dockerhub
* $ docker push durands/get-started:part2

6. Put the image onto AWS Fargate to control how many containers get loaded.
(To be continued)
