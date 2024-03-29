{ lib, ... }: {
  globals = { tmux_navigator_no_mappings = lib.mkForce true; };

  keymaps = [
    {
      mode = "n";
      key = "<m-h>";
      action = "<cmd>TmuxNavigateLeft<cr>";
      options = {
        silent = true;
        desc = "Navigate left";
      };
    }
    {
      mode = "n";
      key = "<m-j>";
      action = "<cmd>TmuxNavigateDown<cr>";
      options = {
        silent = true;
        desc = "Navigate down";
      };
    }
    {
      mode = "n";
      key = "<m-k>";
      action = "<cmd>TmuxNavigateUp<cr>";
      options = {
        silent = true;
        desc = "Navigate up";
      };
    }
    {
      mode = "n";
      key = "<m-l>";
      action = "<cmd>TmuxNavigateRight<cr>";
      options = {
        silent = true;
        desc = "Navigate right";
      };
    }
  ];

  plugins = {
    tmux-navigator = {
      enable = true;

      settings = {
        no_wrap = true;
        disable_when_zoomed = true;
      };
    };
  };
}
