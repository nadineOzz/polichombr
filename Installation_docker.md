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
   docker run --rm --name init -v $PATH/data:/opt/data -p 7500:7500 -ti polichombr
   ```
In the docker container

```  
   ./init.sh
   ./run.sh
  ```

Please enjoy your new polichombr instance by accessing your host at  port 7500
