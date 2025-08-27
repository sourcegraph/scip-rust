FROM rust:1.89.0@sha256:e090f7b4adf86191313dba91260351d7f5e15cac0fe34f26706a805c0cb9641f

COPY scip-rust /usr/local/bin/scip-rust

RUN chmod +x /usr/local/bin/scip-rust

RUN rustup component add rust-analyzer
