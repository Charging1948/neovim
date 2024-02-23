{pkgs, ...}: {
  plugins.magma-nvim = {
    enable = true;
    package = pkgs.callPackage ./magma-override.nix {};
    imageProvider = "kitty";
    settings = {hostname = "localhost:9010";};
  };
}
