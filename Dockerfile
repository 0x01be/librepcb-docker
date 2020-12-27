FROM 0x01be/base

ENV REVISION=master
RUN apk add --no-cache --virtual librepcb-build-dependencies \
    git \
    build-base \
    libressl-dev \
    zlib-dev \
    qt5-qtbase-dev

RUN git clone --recursive --branch ${REVISION} https://github.com/LibrePCB/LibrePCB.git /librepcb

WORKDIR /librepcb/build

RUN apk add qt5-qtsvg-dev

RUN qmake-qt5 -r ../librepcb.pro
RUN make
RUN make install
