FROM nginx:1.18.0
RUN apt update -y && apt install -y build-essential libpng-dev pkg-config

ADD libgd-2.3.0.tar.gz /
# COPY gdImageColorTransparent.patch libgd-2.3.0
# RUN cd libgd-2.3.0 && patch src/gd.c < gdImageColorTransparent.patch

COPY gdImageColorTransparentDisable.patch libgd-2.3.0
RUN cd libgd-2.3.0 && patch src/gd.c < gdImageColorTransparentDisable.patch

COPY gdImageCopyResized.patch libgd-2.3.0
RUN cd libgd-2.3.0 && patch src/gd.c < gdImageCopyResized.patch


RUN cd libgd-2.3.0 && ./configure && make && make install
RUN ldconfig

COPY site /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

