FROM rust:1.92.0@sha256:02fc8ce2ce3d93ba228e503907fee24d9796c837eda6ba382da3917bc4416857

COPY scip-rust /usr/local/bin/scip-rust

RUN chmod +x /usr/local/bin/scip-rust

RUN rustup component add rust-analyzer
