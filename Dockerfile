FROM rust:1.66.1@sha256:f72949bcf1daf8954c0e0ed8b7e10ac4c641608f6aa5f0ef7c172c49f35bd9b5

COPY scip-rust /usr/local/bin/scip-rust

RUN chmod +x /usr/local/bin/scip-rust

RUN curl -sfL https://github.com/rust-analyzer/rust-analyzer/releases/download/2023-01-23/rust-analyzer-x86_64-unknown-linux-gnu.gz --output rust-analyzer.gz && \
  gunzip rust-analyzer.gz && \
  chmod +x /rust-analyzer && \
  mv /rust-analyzer /usr/local/bin
