_: {
  config = {
    opts = {
      list = true;
      listchars = "eol:↴,nbsp:↲,space: ,tab: ,trail:-";
    };

    plugins = {
      indent-blankline = {
        # Removed
        # showEndOfLine = true;
        # useTreesitter = true;
        # spaceCharBlankline = " ";

        enable = true;

        settings = {
          scope = {
            enabled = true;
            show_start = true;
          };
          exclude = {
            buftypes = [ "terminal" "nofile" ];
            filetypes = [ "help" "dashboard" "NvimTree" "Trouble" ];
          };
        };
      };
    };
  };
}
