#############################################################################
###   Build-support Phase   #################################################
#############################################################################
FROM gcc:latest AS planet-builder

RUN mkdir -p /planet && \
    cd /planet && \
    curl -o planet.zip http://hjemmesider.diku.dk/~torbenm/Planet/planet.zip && \
    unzip planet.zip && \
    gcc planet.c -o planet -l:libm.a -O -static

#############################################################################
###   Build Phase   #########################################################
#############################################################################
FROM scratch

COPY files/*.col /
COPY --from=planet-builder /planet/planet /planet
COPY --from=planet-builder /planet/*.col /

ENTRYPOINT ["/planet"]
