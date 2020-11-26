REM stop container if already running
docker stop pjython

REM build image
docker build -f Dockerfile.dev -t pjython .

REM start container, add file share and set PYTHONPATH
docker run -d --name pjython -it ^
-v %cd%/app:/app ^
-p 127.0.0.1:8080:5500/tcp ^
--env PYTHONPATH=/app/be ^
--rm pjython

REM Install python dependencies
docker exec pjython pip3 install -r /app/be/requirements.txt

REM Start flask
docker exec pjython python3 -m swagger_server