# webmin-on-container
Webmin run on docker using Ubuntu 20.04 image.
This can be used as based image for other apps that support by webmin such as Squid proxy
# How to run it with docker-compose
docker-compose up -d
# How to run with docker cli:
docker run --rm -d --name webmin -p 10000:10000 trucv/webmin:latest


