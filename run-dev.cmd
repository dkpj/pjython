REM stop container if already running
docker stop pjython

REM build image
docker build -f Dockerfile.dev -t pjython .

REM start container 
docker run -d --name pjython -it ^
-v %cd%/app:/app ^
-p 127.0.0.1:8080:5500/tcp ^
--rm pjython

REM Install python dependencies
docker exec pjython pip install -r /app/be/requirements.txt

REM Start flask
docker exec pjython python3 /app/be/rest-server.py