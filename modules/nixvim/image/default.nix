{
  pkgs,
  lib,
  ...
}:
with lib.plusultra; {
  extraPackages = with pkgs; [ueberzug];
  plugins.image = {
    enable = true;
    backend = "kitty";
  };
}
