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
###   Build-support Phase   #################################################
#############################################################################
FROM golang:alpine AS go-builder

COPY files/cat.go /cat.go
RUN go build -o /bin/gocat /cat.go

#############################################################################
###   Build Phase   #########################################################
#############################################################################
FROM scratch

COPY files/*.col /
COPY files/Example.txt /
COPY --from=planet-builder /planet/planet /planet
COPY --from=planet-builder /planet/Manual.txt /Manual.txt
COPY --from=planet-builder /planet/*.col /
COPY --from=go-builder /bin/gocat /cat

ENTRYPOINT ["/planet"]
