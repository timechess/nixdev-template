{pkgs, ...}:
pkgs.mkShell rec {
  buildInputs = with pkgs; [
    gcc
    gnumake
    gdb
    glib
    clang-tools
    cmake
    codespell
    conan
    cppcheck
    doxygen
    gtest
    lcov
    vcpkg
    vcpkg-tool
  ];
  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath ([pkgs.stdenv.cc.cc] ++ buildInputs);
  shellHook = ''
  '';
}
