{
  pkgs,
  system,
}:
pkgs.mkShell rec {
  packages = (import ./lib.nix).devPkgs {inherit pkgs system;};
  LD_LIBRARY_PATH =
    (pkgs.lib.makeLibraryPath ([pkgs.stdenv.cc.cc] ++ packages));
}