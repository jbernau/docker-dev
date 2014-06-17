# Develop with Docker
  
## Start a container
  
```
docker run -i -t --rm -p 3000:3000 -v `pwd`:/src \
  sqldump/docker-dev:latest /bin/bash
```
  
### The run command
  
`-i` will start the container in interactive mode (versus `-d` for daemon mode)
  
`-t` allocates a pseudo-tty
  
`--rm` will remove the container and clean up once the container has stopped
  
`-p 3000:3000` will map port 3000 on to the host to port 3000 on the container
  
`-v \`pwd\`:/src` will mount the current working directory from the host to `/src` inside the container
  
`sqldump/docker-dev:latest` the name and version of the docker image to run
  
`/bin/bash` is the entry point for the container - when the container starts, it will drop you into a bash shell
  
## Build the Docker Image
  
If you don't want to download the image from the docker index, you can build it locally:
  
```
docker build -t sqldump/my-docker-dev:0.1 .
```
  
and run using:
  
```
docker run -i -t --rm -p 3000:3000 -v `pwd`:/src \
  sqldump/my-docker-dev:0.1 /bin/bash
```
  
## Once the container is running
  
Once the container is running, it drops into a bash shell. To run the sample Node app, run:
  
```
/src/docker-run.sh
```
  
This script does a few things:
  
1) Cleans up and fixes the permissions on the `/src/redis` directory  
2) Starts the `redis-server` service  
3) NPM installs `nodemon` globally (to watch for file changes and restart the server)  
4) NPM installs all the dependencies  
5) Starts `server.js` under nodemon  