#############################################################################
###   Build-support Phase   #################################################
#############################################################################
FROM golang:1.12-stretch AS redix-builder

ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GO111MODULE=on
RUN git clone https://github.com/alash3al/redix.git && \
    cd redix && \
    git checkout v1.10 && \
    go install ./...

#############################################################################
###   Build Phase   #########################################################
#############################################################################
FROM scratch

COPY --from=redix-builder /go/bin/redix /redix
EXPOSE 6380 7090
ENTRYPOINT ["/redix"]
