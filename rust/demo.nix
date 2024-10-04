{ pkgs, }:
let
  rust-bin = pkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain;
  rustPlatform = pkgs.makeRustPlatform {
    cargo = rust-bin;
    rustc = rust-bin;
  };
in rustPlatform.buildRustPackage {
  pname = "demo";
  version = "0.0.0";
  checkPhase = "true";

  cargoLock.lockFile = ./Cargo.lock;

  src = pkgs.nix-gitignore.gitignoreSourcePure [ "!Cargo.lock" ] ./.;

}
