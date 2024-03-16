{
  pkgs,
  lib,
  ...
}:
with lib;
with lib.plusultra; {
  plugins = {
    cmp = {
      enable = true;

      settings = {
        completion.autocomplete = [
          "require('cmp.types').cmp.TriggerEvent.InsertEnter"
          "require('cmp.types').cmp.TriggerEvent.TextChanged"
        ];
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        window.documentation.border = ["╭" "─" "╮" "│" "╯" "─" "╰" "│"];
      };

      filetype = {
        qmd.sources = [
          {
            name = "otter";
            groupIndex = 1;
            priority = 50;
          }
          {
            name = "latex_symbols";
            groupIndex = 1;
          }
          {
            name = "pandoc_references";
            groupIndex = 1;
          }
        ];

        tex.sources = [
          {
            name = "latex_symbols";
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

      settings.sources = [
        {
          name = "calc";
          groupIndex = 1;
        }
        {
          name = "treesitter";
          groupIndex = 1;
        }
        {
          name = "path";
          groupIndex = 1;
        }
        {
          name = "luasnip";
          option = {show_autosnippets = true;};
          groupIndex = 1;
        }
        {
          name = "copilot";
          groupIndex = 1;
        }
        {
          name = "nvim_lsp";
          groupIndex = 1;
        }
        {
          name = "nvim_lsp_signature_help";
          groupIndex = 1;
        }
        {
          name = "spell";
          groupIndex = 2;
        }
        {
          name = "emoji";
          groupIndex = 2;
        }
        {
          name = "rg";
          groupIndex = 2;
        }
        {
          name = "buffer";
          groupIndex = 2;
          priority = 1;
          # Words from other open buffers can also be suggested.
          option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          keyword_length = 5;
        }
      ];

      settings.mapping = lua.mkRaw ''
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<C-l>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        ["<C-n>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-p>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      '';
    };
  };

  extraConfigLuaPost = ''
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  '';
}
