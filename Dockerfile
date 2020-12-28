FROM 0x01be/librepcb:build as build

FROM 0x01be/xpra

COPY --from=build /opt/librepcb/ /opt/librepcb/

RUN apk add --no-cache --virtual librepcb-runtime-dependencies \
    libressl \
    zlib \
    qt5-qtbase \
    qt5-qtsvg \
    qt5-qtbase-sqlite \
    mesa-dri-swrast

USER ${USER}
ENV PATH=${PATH}:/opt/librepcb/bin/ \
    COMMAND=librepcb

