{
  lib,
  pkgs,
  ...
}: {
  plugins = {
    # null-ls has been forked to none-ls after the original author archived the project.
    none-ls = {
      enable = true;
      enableLspFormat = true;
      sources = {
        code_actions = {
          eslint_d.enable = true;
          gitsigns.enable = true;
          ltrs.enable = true;
          shellcheck.enable = true;
          statix.enable = true;
        };
        diagnostics = {
          eslint_d.enable = true;
          ansiblelint.enable = true;
          cppcheck.enable = true;
          bandit.enable = true;
          flake8.enable = true;
          gitlint.enable = true;
          golangci_lint.enable = true;
          hadolint.enable = true;
          ktlint.enable = true;
          ltrs.enable = true;
          luacheck.enable = true;
          markdownlint.enable = true;
          mypy.enable = true;
          protolint.enable = true;
          pylint.enable = true;
          revive.enable = true;
          shellcheck.enable = true;
          staticcheck.enable = true;
          statix.enable = true;
          vale.enable = true;
          vulture.enable = true;
          write_good.enable = true;
          yamllint.enable = true;
        };
        formatting = {
          nixfmt.enable = true;
          nixpkgs_fmt.enable = true;
          beautysh.enable = true;

          black.enable = true;
          isort.enable = true;

          cbfmt.enable = true;
          eslint_d.enable = true;
          fnlfmt.enable = true;
          fourmolu.enable = true;
          gofmt.enable = true;
          gofumpt.enable = true;
          goimports.enable = true;
          golines.enable = true;
          jq.enable = true;
          ktlint.enable = true;
          markdownlint.enable = true;
          phpcbf.enable = true;
          pint.enable = true;
          prettier.enable = true;
          protolint.enable = true;
          rustfmt.enable = true;
          shfmt.enable = true;
          sqlfluff.enable = true;
          stylua.enable = true;
          trim_newlines.enable = true;
          trim_whitespace.enable = true;
        };
      };
    };
  };
}
