{ lib, ... }:
with lib;
with lib.plusultra; {
  keymaps = [
    {
      mode = "n";
      key = "<leader>ed";
      action = "<cmd>:Oil<cr>";
      options = {
        silent = true;
        desc = "[e]xplore [d]irectory with Oil.nvim";
      };
    }
    {
      mode = "n";
      key = "<leader>ef";
      action = "<cmd>:Oil --float<cr>";
      options = {
        silent = true;
        desc = "[e]xplore directory with Oil.nvim as [f]loating window";
      };
    }
  ];

  plugins.oil = {
    enable = true;
    viewOptions.showHidden = true;
    columns = {
      icon.enable = true;
      permissions.enable = true;
      type.enable = true;
    };
  };
}
