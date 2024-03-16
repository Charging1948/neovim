{
  pkgs,
  lib,
  ...
}: {
  plugins = {
    # cmp-path.enable = true;
    # cmp-nvim-lua.enable = true;
    # cmp-nvim-lsp.enable = true;
    # cmp-treesitter.enable = true;
    # cmp-dap.enable = true;
    # cmp-fuzzy-path.enable = true;
    # cmp-nvim-lsp-signature-help.enable = true;
    # cmp-latex-symbols.enable = true;
    # cmp-emoji.enable = true;
    # cmp-spell.enable = true;
    # cmp-buffer.enable = true;
    # cmp-calc.enable = true;
    # cmp-pandoc-references.enable = true;

    cmp = {
      enable = true;

      mappingPresets = ["insert"];

      settings = {
        completion.autocomplete = [
          "require('cmp.types').cmp.TriggerEvent.InsertEnter"
          "require('cmp.types').cmp.TriggerEvent.TextChanged"
        ];
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        window.documentation.border = ["╭" "─" "╮" "│" "╯" "─" "╰" "│"];
      };

      menu = {
        nvim_lsp = "[LSP]";
        nvim_lua = "[api]";
        path = "[path]";
        luasnip = "[snip]";
        buffer = "[buffer]";
        neorg = "[neorg]";
        cmp_tabby = "[Tabby]";
        nvim-lua = "[lua]";
        nvim-lsp = "[LSP]";
        treesitter = "[TS]";
        dap = "[dap]";
        fuzzy-path = "[path]";
        nvim-lsp-signature-help = "[sig]";
        latex-symbols = "[LaTeX]";
        emoji = "[emoji]";
        spell = "[spell]";
        calc = "[calc]";
        pandoc-references = "[pndc]";
        otter = "[🦦]";
      };

      filetype = {
        qmd.sources = [
          {
            name = "otter";
            groupIndex = 1;
            priority = 50;
          }
        ];

        neorg.sources = [
          {
            name = "neorg";
            groupIndex = 1;
            priority = 50;
          }
        ];
      };

      sources = [
        {
          name = "path";
          groupIndex = 1;
          priority = 7;
        }
        {
          name = "luasnip";
          option = {show_autosnippets = true;};
          groupIndex = 1;
          priority = 6;
        }
        {
          name = "copilot";
          groupIndex = 1;
          priority = 5;
        }
        {
          name = "nvim_lsp";
          groupIndex = 1;
          priority = 4;
        }
        {
          name = "nvim_lsp_signature_help";
          groupIndex = 1;
          priority = 3;
        }
        {
          name = "pandoc_references";
          groupIndex = 1;
          priority = 2;
        }
        {
          name = "treesitter";
          groupIndex = 1;
          priority = 8;
        }
        {
          name = "spell";
          groupIndex = 2;
          priority = 5;
        }
        {
          name = "calc";
          groupIndex = 2;
          priority = 4;
        }
        {
          name = "latex_symbols";
          groupIndex = 2;
          priority = 3;
        }
        {
          name = "emoji";
          groupIndex = 2;
          priority = 2;
        }
        {
          name = "buffer";
          groupIndex = 2;
          priority = 1;
          # Words from other open buffers can also be suggested.
          option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
        }
      ];

      settings.mapping = {
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
