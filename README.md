# scip-rust

A thin wrapper around `rust-analyzer scip`.

## Usage

Make sure you have a working Rust toolchain (`cargo` and `rustc` on `PATH`) and
[`rust-analyzer`] installed. Then, from the root of your workspace:

``` sh
rust-analyzer scip .
```

That's really all it does. The [`scip-rust`] script in this repo is the same
command with a few preflight checks and toolchain fallbacks.

### Docker

The `ghcr.io/scip-code/scip-rust` image bundles everything:

``` sh
docker run --rm -v "$PWD:/work" ghcr.io/scip-code/scip-rust
```

### Nix

If you use Nix, run it straight from the flake:

``` sh
nix run github:sourcegraph/scip-rust
```

  [`rust-analyzer`]: https://rust-analyzer.github.io/book/installation.html
  [`scip-rust`]: ./scip-rust
