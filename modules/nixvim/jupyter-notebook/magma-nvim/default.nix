{pkgs, ...}: {
  plugins.magma-nvim = {
    enable = true;
    package = pkgs.callPackage ./magma-override.nix {};
    settings = {
      image_provider = "ueberzug";
      hostname = "localhost:9010";
    };
  };
}
