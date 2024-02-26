_: {
  plugins.treesitter-refactor = {
    enable = true;
    highlightCurrentScope.enable = true;
    highlightDefinitions.enable = true;
    navigation.enable = true;
    smartRename.enable = true;
  };
  plugins.treesitter-context = {enable = true;};
  plugins.treesitter-textobjects.lspInterop.enable = true;
}
