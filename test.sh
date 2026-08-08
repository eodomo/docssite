docker stop ericolerudcom
docker rm ericolerudcom
docker build -t hugo-ericolerudcom:latest .
docker run -d -p 80:80 --name ericolerudcom hugo-ericolerudcom:latest
