#############################################################################
###   Build-support Phase   #################################################
#############################################################################
FROM clux/muslrust:latest AS noise-builder

RUN git clone https://github.com/hexagram30/noise.git && \
    cd /volume/noise && \
    cargo build --release && \
    rm -f target/x86_64-unknown-linux-musl/release/*.d \
    target/x86_64-unknown-linux-musl/release/*-*

RUN ls -alrt /volume/noise/target/x86_64-unknown-linux-musl/release

# WORKDIR /volume/noise/target/x86_64-unknown-linux-musl/release

#############################################################################
###   Build Phase   #########################################################
#############################################################################
FROM scratch

COPY --from=noise-builder /volume/noise/target/x86_64-unknown-linux-musl/release/noise \
    /bin/noise
ENTRYPOINT ["/bin/noise"]
