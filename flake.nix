{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        scip-rust = pkgs.writeShellApplication {
          name = "scip-rust";
          runtimeEnv = {
            SCIP_RUST_FALLBACK_CARGO = "${pkgs.cargo}/bin";
            SCIP_RUST_FALLBACK_RUSTC = "${pkgs.rustc}/bin";
            SCIP_RUST_FALLBACK_RUST_ANALYZER = "${pkgs.rust-analyzer}/bin";
          };
          text = builtins.readFile ./scip-rust;
        };
      in
      {
        packages = {
          inherit scip-rust;
          default = scip-rust;
        }
        // pkgs.lib.optionalAttrs pkgs.stdenv.isLinux {
          docker = pkgs.dockerTools.buildLayeredImage {
            name = "scip-rust";
            tag = "latest";
            contents = [
              scip-rust
              pkgs.dockerTools.caCertificates
              pkgs.git
            ];
            fakeRootCommands = "mkdir -p /work /tmp";
            enableFakechroot = true;
            config = {
              Cmd = [ "scip-rust" ];
              WorkingDir = "/work";
              Env = [ "HOME=/tmp" ];
            };
          };
        };

        checks = {
          shellcheck = pkgs.runCommand "check-shellcheck" { } ''
            ${pkgs.shellcheck}/bin/shellcheck ${./scip-rust}
            touch $out
          '';
          nixfmt = pkgs.runCommand "check-nixfmt" { } ''
            ${pkgs.nixfmt}/bin/nixfmt --check ${./flake.nix}
            touch $out
          '';
        };

        devShells.default = pkgs.mkShellNoCC {
          buildInputs = with pkgs; [
            rust-analyzer
            rustc
            cargo
          ];
        };
      }
    );
}
