{ lib
, config
, ...
}: {
  colorschemes.catppuccin = {
    enable = true;
    background.dark = "mocha";
    dimInactive.enabled = true;
    integrations = {
      alpha = config.plugins.alpha.enable;
      cmp = config.plugins.nvim-cmp.enable;

      dap.enabled = config.plugins.dap.enable;
      dap.enable_ui = config.plugins.dap.enable;

      fidget = config.plugins.fidget.enable;
      harpoon = config.plugins.harpoon.enable;

      illuminate.enabled = config.plugins.illuminate.enable;
      illuminate.lsp = config.plugins.illuminate.enable;

      indent_blankline.enabled = config.plugins.indent-blankline.enable;
      indent_blankline.colored_indent_levels = config.plugins.indent-blankline.enable;

      leap = config.plugins.leap.enable;
      lsp_saga = config.plugins.lspsaga.enable;
      native_lsp.enabled = config.plugins.lsp.enable;
      navic.enabled = config.plugins.navic.enable;
      noice = config.plugins.noice.enable;
      notify = config.plugins.notify.enable;
      nvimtree = config.plugins.nvim-tree.enable;
      # overseer = config.plugins.overseer.enable;
      rainbow_delimiters = config.plugins.rainbow-delimiters.enable;
      telescope.enabled = config.plugins.telescope.enable;
      treesitter = config.plugins.treesitter.enable;
      treesitter_context = true;
      which_key = config.plugins.which-key.enable;
    };
  };
}
