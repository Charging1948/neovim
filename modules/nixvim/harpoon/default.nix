{pkgs, ...}: {
  plugins.harpoon = {
    enable = true;
    # package = pkgs.vimPlugins.harpoon2;
    enableTelescope = true;
    keymaps = {
      addFile = "<leader>a";
      toggleQuickMenu = "<C-e>";
      navNext = "<leader>hn";
      navPrev = "<leader>hp";
      tmuxGoToTerminal = {
        "1" = "<C-1>";
        "2" = "<C-2>";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>fm";
      action = "<cmd>:Telescope harpoon marks<cr>";
      options = {
        silent = true;
        desc = "[F]ind Harpoon [M]arks";
      };
    }
  ];
}
