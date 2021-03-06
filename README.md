# pjython - a docker based python development environment
Simple boilerplate for buildning rest-api with a corresponding frontend in a containerized environment

The aim of this project is to deliver a bolierplate for rapid prototyping.

## Features

### Live reload - make changes on the host and watch it take effect on the container
No longer needed to restart Flask for changes to take effect, just refresh your browser.
This also enables a Docker dev environment with a bind mount between the docker host and the docker container

## Prerequisites
* Docker https://www.docker.com/products/docker-desktop
* 

## Getting started

### Development

On windows run:
```
C:\pjython> run-dev.cmd
```

*not tested* On linux run: 
```
$ run-dev.sh
```

Execute curl command:

```
curl --location --request GET 'http://localhost:8080/v2/pet/123' --header 'api_key: test_key'
```

Remove the "REMOVE ME" text with your favorite editor, and watch the change take effect immediately. It's in:
```
app/be/swagger_server/pet_controller.py
```

Execute curl command again to verify the change:

```
curl --location --request GET 'http://localhost:8080/v2/pet/123' --header 'api_key: test_key'
```


### Start container (no dev)

on windows run: `C:\pjython> run.cmd`


## TODO
### 