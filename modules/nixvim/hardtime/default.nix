_: {
  plugins.hardtime = {
    enable = true;
    enabled = false;
    disabledFiletypes = [ "qf" "netrw" "NvimTree" "lazy" "mason" "oil" ];
  };

  keymaps = [{
    mode = "n";
    key = "<leader>tH";
    action = "<cmd>:Hardtime toggle<cr>";
    options = {
      silent = true;
      desc = "Toggle Tree";
    };
  }];
}
