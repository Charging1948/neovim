{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
with lib.plusultra; {
  config = {
    extraPlugins = with pkgs.vimPlugins; [otter-nvim quarto-nvim];
    extraPackages = with pkgs; [quarto typst typstfmt typst-lsp typst-live];

    extraConfigLuaPost = ''
      require('otter').setup({
        buffers = {
          -- if set to true, the filetype of the otterbuffers will be set.
          -- otherwise only the autocommand of lspconfig that attaches
          -- the language server will be executed without setting the filetype
          set_filetype = true,
        },
      })

      require('quarto').setup({
        lspFeatures = {
          languages = { "r", "python", "julia", "bash", "lua", "html", "dot", "javascript", "typescript", "ojs" },
        },
        codeRunner = {
          enabled = true,
          default_method = 'molten',
        },
      })
    '';
  };
}
