# scip-rust

At the moment, this is just a tiny wrapper around `rust-analyzer` to generate SCIP data,
with the configuration set up for use by Sourcegraph.

## Usage

Install [`rust-analyzer`](https://rust-analyzer.github.io/book/installation.html) (any recent
release works), make sure `cargo` and `rustc` are on `PATH`, then from the root of your
workspace run:

```sh
rust-analyzer scip .
```

The [`scip-rust`](./scip-rust) script in this repo is the same one-liner with a few
preflight checks; you can drop it into `PATH` if you prefer a stable command name.

For CI, the `sourcegraph/scip-rust` Docker image bundles everything:

```sh
docker run --rm -v "$PWD:/work" sourcegraph/scip-rust
```

If you want to upload LSIF to Sourcegraph.com in CI, check out
[lsif-rust-action](https://github.com/sourcegraph/lsif-rust-action) instead.
