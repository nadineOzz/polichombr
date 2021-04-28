# Installation with docker

To use polichombr as a docker container, we provide a *DockerFile*
in the root directory.

On the host machine:

```
   mkdir FOLDER_NAME
   mkdir FOLDER_NAME/opt
   mkdir FOLDER_NAME/opt/data/storage
   cd    FOLDER_NAME/opt
   docker build -t [DOCKER_IMAGE_NAME] .
   docker run --rm -d --name [CONTAINER_NAME] -v $PATH/data/storage:/opt/data/storage -p 7500:7500 -ti [DOCKER_IMAGE_NAME]
   ```
Access the docker container

```
   docker exec -it [CONTAINER_ID] bash
   
```
In the docker container

```  
   ./init.sh
   ./run.sh
  ```

Please enjoy your new polichombr instance by accessing your host at  port 7500


*IF IT DOES NOT WORK:*

Please make sure the init.sh file looks like below:

```
   . /opt/polichombr/flask/bin/activate && /opt/polichombr/db_create.py

```
