#!/bin/bash

echo 'Stop container if already running'
docker stop pjython

echo 'Build image'
docker build -f Dockerfile.dev -t pjython .

echo 'Start container'
docker run -d --name pjython -it \
-v $(pwd)/app:/app \
-p 127.0.0.1:8080:5500/tcp \
--rm pjython

echo 'Install python dependencies'
docker exec pjython pip install -r /app/be/requirements.txt

echo 'Start flask'
docker exec pjython python3 /app/be/rest-server.py