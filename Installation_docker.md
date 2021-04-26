# Installation with docker

To use polichombr as a docker container, we provide a *DockerFile*
in the root directory.

On the host machine:

```
   mkdir FOLDER_NAME
   mkdir FOLDER_NAME/data
   mkdir FOLDER_NAME/opt
   mkdir FOLDER_NAME/opt/data
   cd    FOLDER_NAME/opt
   docker build -t polichombr .
   docker run --rm -d --name [CONTAINER_NAME] -v $PATH/data:/opt/data -p 7500:7500 -ti polichombr
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

You may need to edit the init.sh file in the docker container
Please modify it like under:

```
   . /opt/polichombr/flask/bin/activate && /opt/polichombr/db_create.py

```
