REM stop container if already running
docker stop pjython-codegen

REM build image
docker build --no-cache -f Dockerfile.codegen -t pjython-codegen .

REM start container, add file share and set PYTHONPATH
docker run -d --name pjython-codegen -it ^
--rm pjython-codegen