{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
with lib.plusultra; {
  config = {
    extraPlugins = with pkgs.vimPlugins; [neodev-nvim];

    extraConfigLuaPre = ''
      require("neodev").setup {
        lspconfig = true,
        library = {
          enabled = true,
          plugins = true,
          runtime = true,
          types = true,
        },
      }
    '';

    options = {laststatus = 3;};

    plugins.lualine = {
      enable = true;

      globalstatus = true;

      disabledFiletypes = {
        statusline = ["dashboard"];
        winbar = ["dashboard"];
      };

      componentSeparators = {
        left = "⋮";
        right = "⋮";
      };
      sectionSeparators = {
        left = "";
        right = "";
      };

      sections = {
        lualine_a = [
          {
            name = lua.mkRaw ''
              function
              ()
                return ""
                end
            '';
          }
        ];
        lualine_b = [
          {
            name = "branch";
            icon = "";
          }
          {name = "diff";}
        ];
        lualine_c = [
          {
            name = "macro_recording";
            extraConfig = {
              fmt = lua.mkRaw ''
                function()
                  local recording_register = vim.fn.reg_recording()
                  if recording_register == "" then
                    return ""
                  else
                    return "Recording @" .. recording_register
                  end
                end
              '';
              color = {fg = "#ff9e64";};
            };
          }
        ];
        lualine_x = [
          {
            name = "diagnostics";
            extraConfig = {update_in_insert = false;};
          }
        ];
        lualine_y = null;
        lualine_z = [
          {name = "%l:%c";}
          {
            name = "fileformat";
            extraConfig = {icon_only = true;};
          }
        ];
      };

      tabline = {
        lualine_a = null;
        lualine_b = null;
        lualine_c = [
          {
            name = "windows";
            extraConfig = {
              symbols = {
                modified = "";
                readonly = "";
                unnamed = " ";
                newfile = " ";
              };
            };

            separator = {right = "";};
          }
        ];
        lualine_x = null;
        lualine_y = null;
        lualine_z = [
          {
            name = "tabs";

            separator = {left = "";};
          }
        ];
      };

      winbar = {
        lualine_a = null;
        lualine_b = null;
        lualine_c = [
          {
            name = lua.mkRaw ''
              function()
              return require("nvim-navic").get_location()
              end
            '';
          }
        ];
        lualine_x = null;
        lualine_y = null;
        lualine_z = [
          {
            name = "filetype";
            extraConfig = {
              colored = false;
              icon_only = true;
            };
          }
          {
            name = "filename";
            extraConfig = {
              file_status = true;
              shorting_target = 25;
              path = 1;

              symbols = {
                modified = "";
                readonly = "";
                unnamed = " ";
                newfile = " ";
              };
            };

            separator = {left = "";};
          }
        ];
      };

      inactiveWinbar = {
        lualine_a = null;
        lualine_b = null;
        lualine_c = null;
        lualine_x = null;
        lualine_y = null;
        lualine_z = [
          {
            name = "filetype";
            extraConfig = {
              colored = false;
              icon_only = true;
            };
          }
          {
            name = "filename";
            extraConfig = {
              file_status = true;
              path = 1;
              shorting_target = 25;

              symbols = {
                modified = "";
                readonly = "";
                unnamed = " ";
                newfile = " ";
              };
            };

            separator = {left = "";};
          }
        ];
      };
    };
  };
}
