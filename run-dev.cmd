REM stop container if already running
docker stop pjython

REM build image
docker build --no-cache -f Dockerfile.dev -t pjython .

REM start container, add file share and set PYTHONPATH
docker run -d --name pjython -it ^
-v %cd%/app:/app/fs ^
-p 127.0.0.1:8080:5500/tcp ^
--env PYTHONPATH=/app/src-gen ^
--rm pjython

REM Install python dependencies
docker exec pjython pip3 install -r /app/src-gen/requirements.txt

REM install application
docker exec pjython python3 /app/src-gen/setup.py install 

REM create sym link to impl folder

REM Start flask
docker exec pjython python3 -m openapi_server