_: {
  plugins.navbuddy = {
    enable = true;
    lsp.autoAttach = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>nb";
      action = "<Cmd>:Navbuddy<CR>";
    }
  ];
}
