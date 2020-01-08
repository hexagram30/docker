#############################################################################
###   Build-support Phase   #################################################
#############################################################################
FROM clux/muslrust:latest AS noise-builder

RUN git clone https://github.com/Razaekel/noise-rs.git && \
    cd noise-rs && \
    git checkout v0.6.0

WORKDIR /volume/noise-rs
COPY files/caves.rs /volume/noise-rs/examples
COPY files/Caves.toml /tmp/Caves.toml

RUN cat /tmp/Caves.toml >> Cargo.toml && \
    cargo build --example=caves && \
    rm -f target/x86_64-unknown-linux-musl/debug/examples/*.d \
    target/x86_64-unknown-linux-musl/debug/examples/*-*

RUN ls -alrt target/x86_64-unknown-linux-musl/debug/examples

# WORKDIR /volume/noise-rs/target/x86_64-unknown-linux-musl/debug

#############################################################################
###   Build Phase   #########################################################
#############################################################################
FROM scratch

COPY --from=noise-builder /volume/noise-rs/target/x86_64-unknown-linux-musl/debug/examples \
    /bin
ENTRYPOINT ["/bin/caves"]
