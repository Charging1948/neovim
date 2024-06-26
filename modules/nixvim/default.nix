{
  lib,
  config,
  pkgs,
  ...
}:
with lib.plusultra; {
  config = {
    extraConfigLua = ''
      do
        local which_key = require("which-key")

        local function enable_wrap()
          vim.o.wrap = true
          vim.o.linebreak = true
        end

        local function disable_wrap()
          vim.o.wrap = false
          vim.o.linebreak = false
        end

        local function toggle_wrap()
          if vim.o.wrap then
            disable_wrap()
          else
            enable_wrap()
          end
        end

        which_key.register({
          t = {
            name = "Toggle",
            w = {
              toggle_wrap,
              "Line Wrap"
            },
          },
        }, { mode = "n", prefix = "<leader>", silent = true, noremap = true })
      end
    '';

    keymaps = [
      {
        mode = "n";
        key = "<leader>ch";
        action = "<cmd>noh<cr>";
        options = {
          silent = true;
          desc = "Clear highlight";
        };
      }
      {
        mode = "n";
        key = "<leader>cs";
        action = ''<cmd>let @/=""<cr>'';
        options = {
          silent = true;
          desc = "Clear search";
        };
      }
      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>:BD<cr>";
        options = {
          silent = true;
          desc = "Delete buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>bn";
        action = "<cmd>:bnext<cr>";
        options = {
          silent = true;
          desc = "Next buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>bp";
        action = "<cmd>:bprevious<cr>";
        options = {
          silent = true;
          desc = "Previous buffer";
        };
      }
      {
        mode = "t";
        key = "<C-o>";
        action = "<C-\\><C-n>";
        options = {
          silent = true;
          desc = "Exit terminal mode";
        };
      }
      {
        mode = "n";
        key = "<leader>w";
        action = "<cmd>:w<cr>";
        options = {
          silent = true;
          desc = "Write current buffer";
        };
      }
    ];

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    extraPackages = with pkgs; [ripgrep fd];

    clipboard = {
      register = "unnamedplus";
      providers = {
        xclip.enable = true;
        wl-copy.enable = true;
      };
    };

    opts = {
      autoindent = true;
      cursorline = true;
      tabstop = 2;
      shiftwidth = 2;
      wrap = true;
      linebreak = true;

      mouse = "a";
      number = true;
      relativenumber = true;

      scrolloff = 12;
      sidescrolloff = 8;
      foldlevelstart = 99;
    };

    luaLoader.enable = true;

    autoCmd = [
      {
        event = ["BufRead" "BufNewFile"];
        pattern = ["*.txt" "*.md" "*.tex"];
        command = "setlocal spell";
      }
    ];
  };
}
