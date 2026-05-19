# scip-rust

A thin wrapper around `rust-analyzer scip`.

## Usage

Make sure you have a working Rust toolchain (`cargo` and `rustc` on `PATH`) and
[`rust-analyzer`] installed. Then, from the root of your workspace:

``` sh
rust-analyzer scip .
```

That's really all it does. The [`scip-rust`] script in this repo is the same
command with a few preflight checks and toolchain fallbacks --- drop it into
`PATH` if you want a stable command name.

### Docker

For CI, the `sourcegraph/scip-rust` image bundles everything:

``` sh
docker run --rm -v "$PWD:/work" sourcegraph/scip-rust
```

### Nix

If you use Nix, run it straight from the flake:

``` sh
nix run github:sourcegraph/scip-rust
```

## Limitations

`scip-rust` expects one Cargo project per run. If your repo has several
independent crates or workspaces (or no `Cargo.toml` at the path you pass), the
run fails. Index each project on its own and upload the results separately.
Details in [issue #5].

  [`rust-analyzer`]: https://rust-analyzer.github.io/book/installation.html
  [`scip-rust`]: ./scip-rust
  [issue #5]: https://github.com/sourcegraph/scip-rust/issues/5
