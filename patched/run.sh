#!/bin/sh
docker rm --force nginx-image-patched

LIBGD="libgd-2.3.0.tar.gz"
[[ ! -f $LIBGD ]] && wget https://github.com/libgd/libgd/releases/download/gd-2.3.0/$LIBGD


docker build -t nginx-image-patched .

docker run --name nginx-image-patched -p 8081:80 -d nginx-image-patched

