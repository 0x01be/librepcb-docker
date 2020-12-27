FROM 0x01be/base

ENV REVISION=master
RUN apk add --no-cache --virtual librepcb-build-dependencies \
    git \
    build-base \
    libressl-dev \
    zlib-dev \
    qt5-qtbase-dev \
    qt5-qtsvg-dev &&\
    git clone --recursive --branch ${REVISION} https://github.com/LibrePCB/LibrePCB.git /librepcb

WORKDIR /librepcb/build

RUN qmake-qt5 -r ../librepcb.pro PREFIX=/opt/librepcb &&\
    make
RUN make install

