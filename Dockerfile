FROM rust:1.91.1@sha256:cd34b27bc6df5450e4952075dc6bd3881a1aeb8f5d0478cd75c2160ca47e2182

COPY scip-rust /usr/local/bin/scip-rust

RUN chmod +x /usr/local/bin/scip-rust

RUN rustup component add rust-analyzer
