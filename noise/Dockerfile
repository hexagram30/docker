#############################################################################
###   Build-support Phase   #################################################
#############################################################################
# FROM rust:1.40.0-stretch AS noise-builder
# FROM rust:1.40.0-stretch
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

# RUN cd noise-rs && cargo rustc -- -C target-feature=+static
# RUN cd noise-rs && cargo build --release
# RUN rustc --target=x86_64-unknown-linux-musl ./examples/billow.rs || \
#     rustc --explain E0463
# RUN cargo help build

# RUN cargo build --release
# RUN rustup target add x86_64-unknown-linux-musl
# RUN cargo build --examples
# RUN ls -alrt target/x86_64-unknown-linux-musl/release
# RUN ls -alrt target/x86_64-unknown-linux-musl/release/examples
# RUN ls -alrt target/x86_64-unknown-linux-musl/release/build
# RUN ls -alrt target/x86_64-unknown-linux-musl/debug
RUN echo bust
RUN ls -alrt target/x86_64-unknown-linux-musl/debug/examples
# RUN ls -alrt target/x86_64-unknown-linux-musl/debug/build
# RUN ls -alrt ./
# RUN find target/x86_64-unknown-linux-musl -type f
# RUN ls -alrt ./examples
# RUN cat Cargo.toml
# RUN cat ./examples/billow.rs
# RUN ls -alrt examples

# WORKDIR /volume/noise-rs/target/x86_64-unknown-linux-musl/debug

#############################################################################
###   Build Phase   #########################################################
#############################################################################
FROM scratch

COPY --from=noise-builder /volume/noise-rs/target/x86_64-unknown-linux-musl/debug/examples \
    /bin
ENTRYPOINT ["/bin/caves"]
