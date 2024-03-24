{ pkgs, lib, ... }:
with lib;
with lib.plusultra; {
  plugins = {
    cmp = {
      enable = true;

      settings = {
        snippet.expand =
          "function(args) require('luasnip').lsp_expand(args.body) end";
        window.documentation.border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
        window.completion.border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
      };

      filetype = {
        qmd.sources = [
          { name = "otter"; }
          { name = "latex_symbols"; }
          { name = "pandoc_references"; }
        ];

        tex.sources = [{ name = "latex_symbols"; }];

        # neorg.sources = [{
        #   name = "neorg";
        #   groupIndex = 1;
        #   priority = 50;
        # }];
      };

      settings.sources = [
        # { name = "calc"; }
        { name = "treesitter"; }
        { name = "path"; }
        {
          name = "luasnip";
          option = { show_autosnippets = true; };
        }
        { name = "copilot"; }
        { name = "nvim_lsp"; }
        {
          name = "nvim_lsp_signature_help";
        }
        # { name = "spell"; }
        {
          name = "emoji";
        }
        # { name = "rg"; }
        {
          name = "buffer";
          option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          keyword_length = 5;
        }
      ];

      # settings.mapping = {
      #   "<C-Space>" = "cmp.mapping.complete()";
      #   "<C-j>" = "cmp.mapping.scroll_docs(4)";
      #   "<C-k>" = "cmp.mapping.scroll_docs(-4)";
      #   "<C-l>" =
      #     "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
      #   "<C-n>" = ''
      #     cmp.mapping(function(fallback)
      #       local has_words_before = function()
      #         unpack = unpack or table.unpack
      #         local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      #         return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      #       end

      #       local luasnip = require("luasnip")
      #       if cmp.visible() then
      #         cmp.select_next_item()
      #       elseif luasnip.expand_or_jumpable() then
      #         luasnip.expand_or_jump()
      #       elseif has_words_before() then
      #         cmp.complete()
      #       else
      #         fallback()
      #       end
      #     end, { "i", "s" })'';

      #   "<C-p>" = ''
      #     cmp.mapping(function(fallback)
      #       local has_words_before = function()
      #         unpack = unpack or table.unpack
      #         local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      #         return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      #       end

      #       local luasnip = require("luasnip")
      #       if cmp.visible() then
      #         cmp.select_prev_item()
      #       elseif luasnip.jumpable(-1) then
      #         luasnip.jump(-1)
      #       else
      #         fallback()
      #       end
      #     end, { "i", "s" })'';
      # };
      settings.mapping = lua.mkRaw ''
        cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-j>"] = cmp.mapping.scroll_docs(4),
          ["<C-k>"] = cmp.mapping.scroll_docs(-4),
          ["<C-l>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          ["<C-n>"] = cmp.mapping(function(fallback)
            local luasnip = require("luasnip")
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
            local luasnip = require("luasnip")
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        })
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
