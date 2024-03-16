_: {
  plugins.navbuddy = {
    enable = true;
    lsp.autoAttach = true;
  };

  keymaps = [
    {
      mode = "n";
      keys = "<leader>nb";
      action = "<Cmd>:Navbuddy<CR>";
    }
  ];
}
