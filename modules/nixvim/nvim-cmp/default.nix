{pkgs, ...}: {
  plugins = {
    cmp-path.enable = true;
    cmp-nvim-lua.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-treesitter.enable = true;
    cmp-dap.enable = true;
    cmp-fuzzy-path.enable = true;
    cmp-nvim-lsp-signature-help.enable = true;
    cmp-latex-symbols.enable = true;
    cmp-emoji.enable = true;
    cmp-spell.enable = true;
    cmp-buffer.enable = true;
    cmp-calc.enable = true;
    cmp-pandoc-references.enable = true;

    cmp = {
      enable = true;

      settings.snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

      mappingPresets = ["insert"];

      sources = [
        {
          name = "otter";
          groupIndex = 1;
          priority = 7;
        }
        {
          name = "path";
          groupIndex = 1;
          priority = 6;
        }
        {
          name = "luasnip";
          option = {show_autosnippets = true;};
          groupIndex = 1;
          priority = 5;
        }
        {
          name = "copilot";
          groupIndex = 1;
          priority = 4;
        }
        {
          name = "nvim_lsp";
          groupIndex = 1;
          priority = 3;
        }
        {
          name = "nvim_lsp_signature_help";
          groupIndex = 1;
          priority = 2;
        }
        {
          name = "pandoc_references";
          groupIndex = 1;
          priority = 1;
        }
        {
          name = "buffer";
          groupIndex = 2;
          priority = 6;
          option = {};
        }
        {
          name = "spell";
          groupIndex = 2;
          priority = 5;
        }
        {
          name = "treesitter";
          groupIndex = 2;
          priority = 4;
        }
        {
          name = "calc";
          groupIndex = 2;
          priority = 3;
        }
        {
          name = "latex_symbols";
          groupIndex = 2;
          priority = 2;
        }
        {
          name = "emoji";
          groupIndex = 2;
          priority = 1;
        }
      ];

      mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-j>" = "cmp.mapping.scroll_docs(4)";
        "<C-k>" = "cmp.mapping.scroll_docs(-4)";
        "<C-l>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        "<C-n>" = {
          action = ''
            function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif require("luasnip").expand_or_jumpable() then
                require("luasnip").expand_or_jump()
              else
                fallback()
              end
            end
          '';

          modes = ["i" "s"];
        };
        "<C-p>" = {
          action = ''
            function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require("luasnip").expand_or_jumpable() then
                require("luasnip").expand_or_jump()
              else
                fallback()
              end
            end
          '';

          modes = ["i" "s"];
        };
      };
    };
  };
}
