{
  lib,
  pkgs,
  config,
  ...
}:
with lib.plusultra; {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "dbsession.nvim";
      version = "unstable-2024-01-31";
      src = pkgs.fetchFromGitHub {
        owner = "nvimdev";
        repo = "dbsession.nvim";
        rev = "cdf680b9ed91c735418706b1125df91e5ba39251";
        sha256 = "UJXzYQsRlTNudgHs+ugxgxg7zq/61xW8aonsEhlfNC8=";
      };
    })
  ];

  extraConfigLua = ''
    require("dbsession").setup {
      dir = os.getenv("HOME") .. "/.config/dashboard-nvim",
      auto_save_on_exit = false,
    }
  '';

  # highlight = {
  #   DashboardShortCut = {
  #     fg = nord3;
  #   };
  # };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ss";
      action = "<cmd>SessionSave<cr>";
      options = {
        silent = true;
        desc = "Save session";
      };
    }
    {
      mode = "n";
      key = "<leader>sl";
      action = "<cmd>SessionLoad<cr>";
      options = {
        silent = true;
        desc = "Load session";
      };
    }
  ];

  plugins = {
    dashboard = {
      enable = true;

      hideStatusline = true;
      hideTabline = true;

      # project = {
      #   enable = true;
      #   icon = "󰉋 ";
      #   label = "Projects";
      #   limit = 8;
      #   action = "e ";
      # };
      #
      # mru = {
      #   icon = " ";
      #   label = "Recent Files";
      #   limit = 10;
      # };

      center = [
        {
          icon = " ";
          desc = "Open File ";
          shortcut = "f";
          action = "Telescope find_files";
        }
        {
          icon = " ";
          desc = "Open Recent ";
          shortcut = "r";
          action = "Telescope oldfiles";
        }
        {
          icon = " ";
          desc = "Open Config ";
          shortcut = "c";
          action = "e $HOME/config/";
        }
      ];

      header = [
        ""
        ""
        "┏━┓╻  ╻ ╻┏━┓╻ ╻╻  ╺┳╸┏━┓┏━┓"
        "┣━┛┃  ┃ ┃┗━┓┃ ┃┃   ┃ ┣┳┛┣━┫"
        "╹  ┗━╸┗━┛┗━┛┗━┛┗━╸ ╹ ╹┗╸╹ ╹"
        ""
      ];

      # footer = lua.mkRaw ''
      #   (function()
      #     local fortune_handle = io.popen("${pkgs.fortune}/bin/fortune -s")
      #     local fortune_output = nil
      #
      #     if fortune_handle ~= nil then
      #       fortune_output = fortune_handle:read("*a")
      #       fortune_handle:close()
      #     else
      #       fortune_output = "fortune_handle was nil"
      #     end
      #
      #     local footer = { "", "" }
      #
      #     if fortune_output ~= nil then
      #       for line in string.gmatch(fortune_output, "(.-)\n") do
      #         table.insert(footer, line)
      #       end
      #     else
      #       table.insert(footer, "Go even further beyond ✨")
      #     end
      #
      #     return footer
      #   end)()
      # '';
    };
  };
}
