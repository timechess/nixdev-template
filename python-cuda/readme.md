# README

To enable cuda in NixOS, first you should install the following packages on your system.

```
git
gitRepo
gnupg
autoconf
curl
procps
gnumake
util-linux
m4
gperf
unzip
cudatoolkit
linuxPackages.nvidia_x11
libGLU libGL
xorg.libXi xorg.libXmu freeglut
xorg.libXext xorg.libX11 xorg.libXv xorg.libXrandr zlib
ncurses5
stdenv.cc
binutils
```

The environment variables are already set in `shell.nix`.

Reference: [CUDA](https://nixos.wiki/wiki/CUDA)