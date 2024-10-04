{
  pkgs,
  system,
}:
pkgs.mkShell rec {
  packages = (import ./lib.nix).devPkgs {inherit pkgs system;};
  LD_LIBRARY_PATH =
    (pkgs.lib.makeLibraryPath ([pkgs.stdenv.cc.cc] ++ packages));

  shellHook = ''
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/run/opengl-driver/lib
    export CUDA_PATH=${pkgs.cudatoolkit}
    export EXTRA_LDFLAGS="-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib"
    export EXTRA_CCFLAGS="-I/usr/include"
  '';
}