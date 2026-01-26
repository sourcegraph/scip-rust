FROM rust:1.93.0@sha256:4c7eb947d7e078f5c076e086c7b75c36ea0ec7c685f2244b3d79306deb7e44b7

COPY scip-rust /usr/local/bin/scip-rust

RUN chmod +x /usr/local/bin/scip-rust

RUN rustup component add rust-analyzer
