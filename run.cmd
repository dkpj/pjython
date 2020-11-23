docker stop pjython

docker build -f Dockerfile -t pjython .

docker run -d --name pjython -it ^
-p 127.0.0.1:8080:5500/tcp ^
--rm pjython