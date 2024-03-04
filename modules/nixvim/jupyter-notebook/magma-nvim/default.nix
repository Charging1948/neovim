{ pkgs, ... }: {
  plugins.magma-nvim = {
    enable = true;
    package = pkgs.callPackage ./magma-override.nix { };
    imageProvider = "ueberzug";
    settings = { hostname = "localhost:9010"; };
  };
}
