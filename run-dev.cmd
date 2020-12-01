REM stop container if already running
docker stop pjython

REM build image
docker build --no-cache -f Dockerfile.dev -t pjython .

REM start container, add file share and set PYTHONPATH
docker run -d --name pjython -it ^
-v %cd%/app:/app/fs ^
-p 127.0.0.1:8080:8080/tcp ^
--env PYTHONPATH=/app/src-gen ^
--rm pjython

REM install application
docker exec pjython python3 /app/src-gen/setup.py install 

REM create sym link to impl folder
docker exec pjython ln -s /app/fs/be/src/controller /app/src-gen/openapi_server/controller

REM Start flask
docker exec pjython python3 -m openapi_server