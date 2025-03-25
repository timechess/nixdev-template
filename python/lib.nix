{
  devPkgs = {
    pkgs,
    system ? "x86_64-linux",
  }:
    with pkgs; [
        uv
        gnumake
        ruff
      ];
}