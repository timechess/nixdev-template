{ pkgs, system, }:
pkgs.mkShell {

  buildInputs = [
    pkgs.pkgsCross.mingwW64.buildPackages.gcc
    pkgs.pkgsCross.mingwW64.stdenv.cc
    pkgs.pkgsCross.mingwW64.windows.mingw_w64_pthreads
  ];

  packages = with pkgs; [
    alejandra
    nixfmt
    ((rust-bin.fromRustupToolchainFile ./rust-toolchain).override {
      extensions = [ "rust-src" "rust-analyzer" ];
      targets = [ "x86_64-pc-windows-gnu" "x86_64-unknown-linux-gnu" ];
    })
    cargo-edit
    cargo-hakari

  ];

}
