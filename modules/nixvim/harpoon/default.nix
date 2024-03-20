{ pkgs, ... }: {
  plugins.harpoon = {
    enable = true;
    # package = pkgs.vimPlugins.harpoon2;
    enableTelescope = true;
    keymaps = {
      addFile = "<leader>a";
      toggleQuickMenu = "<C-e>";
      navNext = "<leader>nn";
      navPrev = "<leader>np";
      tmuxGotoTerminal = {
        "1" = "<C-1>";
        "2" = "<C-2>";
      };
    };
  };

  extraConfigLuaPost = ''
    local wk = require("which-key")
    wk.register({
      ["<leader>a"] = { desc = "[a]dd harpoon mark" },
      ["<leader>nn"] = { desc = "[n]avigate to [n]ext harpoon mark" },
      ["<leader>np"] = { desc = "[n]avigate to [p]revious harpoon mark" },
    })
  '';

  keymaps = [{
    mode = "n";
    key = "<leader>fm";
    action = "<cmd>:Telescope harpoon marks<cr>";
    options = {
      silent = true;
      desc = "[F]ind Harpoon [M]arks";
    };
  }];
}
