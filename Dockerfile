FROM rust:1.56.0@sha256:927125be1befca4e0f91a81a73cf1108f7552297ab8311d9fbf55b03f1c9246f
RUN curl -sfL https://github.com/rust-analyzer/rust-analyzer/releases/download/2021-11-01/rust-analyzer-x86_64-unknown-linux-gnu.gz --output rust-analyzer.gz && \
  gunzip rust-analyzer.gz && \
  chmod +x /rust-analyzer && \
  mv /rust-analyzer /usr/local/bin
COPY lsif-rust /usr/local/bin/lsif-rust
RUN chmod +x /usr/local/bin/lsif-rust
