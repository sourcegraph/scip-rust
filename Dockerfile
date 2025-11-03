FROM rust:1.91.0@sha256:c0601cfa53ef38705af64f72b6b1f2b8afcd8f76de9aa621a8b45b4fa124694c

COPY scip-rust /usr/local/bin/scip-rust

RUN chmod +x /usr/local/bin/scip-rust

RUN rustup component add rust-analyzer
