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
      local otter = require('otter')
      otter.setup({
        buffers = {
          -- if set to true, the filetype of the otterbuffers will be set.
          -- otherwise only the autocommand of lspconfig that attaches
          -- the language server will be executed without setting the filetype
          set_filetype = true,
        },
      })
      -- table of embedded languages to look for.
      -- required (no default)
      local languages = {'python', 'lua', 'r' }

      -- enable completion/diagnostics
      -- defaults are true
      local completion = true
      local diagnostics = true
      -- treesitter query to look for embedded languages
      -- uses injections if nil or not set
      local tsquery = nil

      otter.activate(languages, completion, diagnostics, tsquery)

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
