{pkgs, ...}: {
  plugins = {
    none-ls = {
      enable = true;
      enableLspFormat = true;
      sources = {
        code_actions = {
          gitsigns.enable = true;
          gitrebase.enable = true;
          ts_node_action.enable = true;
          impl.enable = true;
          gomodifytags.enable = true;
          statix.enable = true;
          proselint.enable = true;
          refactoring.enable = true;
        };
        completion = {
          luasnip.enable = true;
          spell.enable = true;
          tags.enable = true;
        };
        diagnostics = {
          actionlint.enable = true;
          alex.enable = true;
          checkstyle.enable = true;
          codespell.enable = true;
          commitlint.enable = true;
          deadnix.enable = true;
          dotenv_linter.enable = true;
          editorconfig_checker.enable = true;
          gitlint.enable = true;
          golangci_lint.enable = true;
          ktlint.enable = true;
          markdownlint.enable = true;
          mypy.enable = true;
          pylint.enable = true;
          revive.enable = true;
          staticcheck.enable = true;
          statix.enable = true;
          vale.enable = true;
          write_good.enable = true;
          yamllint.enable = true;
          todo_comments.enable = true;
          trail_space.enable = true;
        };
        formatting = {
          alejandra.enable = true;
          blackd.enable = true;
          isort.enable = true;
          gleam_format.enable = true;
          gofumpt.enable = true;
          goimports_reviser.enable = true;
          golines.enable = true;
          just.enable = true;
          ktlint.enable = true;
          markdownlint.enable = true;
          mdformat.enable = true;
          nixfmt.enable = true;
          prisma_format.enable = true;
          pg_format.enable = true;
          prettier.enable = true;
          prettier.disableTsServerFormatter = true;
          shellharden.enable = true;
          sqlfluff.enable = true;
          stylua.enable = true;
          treefmt.enable = true;
          typstfmt.enable = true;
          yamlfmt.enable = true;
          # yamlfix.enable = true;
        };
      };
    };
  };
}
