#!/bin/sh
docker rm --force nginx-image-test

docker build -t nginx-image-test .

docker run --name nginx-image-test -p 8080:80 -d nginx-image-test

