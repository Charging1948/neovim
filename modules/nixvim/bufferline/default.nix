{
  lib,
  pkgs,
  ...
}:
with lib.plusultra; {
  extraPlugins = with pkgs.vimPlugins; [vim-bufkill];

  globals = {BufKillCreateMappings = 0;};

  keymaps = [
    {
      mode = "n";
      key = "gb";
      action = "<cmd>:BufferLinePick<cr>";
      options = {
        silent = true;
        desc = "Go to buffer";
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
  ];

  plugins = {
    bufferline = {
      enable = false;
      mode = "buffers";
      persistBufferSort = true;
      alwaysShowBufferline = true;
      separatorStyle = "slant";
      diagnosticsUpdateInInsert = true;

      showCloseIcon = false;
      showBufferIcons = false;
      showBufferCloseIcons = false;

      offsets = [
        {
          filetype = "NvimTree";
          text = "NvimTree";
          highlight = "Directory";
          textAlign = "left";
        }
      ];

      diagnostics = "nvim_lsp";
      diagnosticsIndicator = ''
        function(_, _, diagnostic)
          local signs = { error = " ", warning = " ", hint = " ", info = " " }
          local severities = { "error", "warning" }
          local strs = {}
          for _, severity in ipairs(severities) do
            if diagnostic[severity] then
              table.insert(strs, signs[severity] .. diagnostic[severity])
            end
          end

          return table.concat(strs, " ")
        end
      '';
    };
  };
}
