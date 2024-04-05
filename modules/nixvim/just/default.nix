{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [
    vim-just
    nvim-treesitter-parsers.just
  ];

  plugins = {
    treesitter = {
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars
        ++ (with pkgs.tree-sitter-grammars; [ tree-sitter-just ]);

      languageRegister = { just = "just"; };
    };
  };
}
