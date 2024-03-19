{ lib, pkgs, ... }:
with lib;
with lib.plusultra; {
  plugins.twilight.enable = true;

  keymaps = [{
    action = "<cmd>:Twilight<CR>";
    key = "<leader>tT";
    options = {
      desc = "Toggle twilight";
      silent = true;
    };
    mode = "n";
  }];
}
