{ lib, pkgs, ... }:
with lib.plusultra; {
  plugins = {
    lspkind = {
      enable = true;
      cmp.enable = true;
    };
    lsp = {
      enable = true;

      onAttach = ''
        do
          local lsp = require("lspconfig")
          local which_key = require("which-key")

          -- See `:help vim.lsp.*` for documentation on any of the below functions
          which_key.register({
            g = {
              name = "Go",
              d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
              D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
              h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
              i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to implementation" },
              n = { "<cmd>lua require('illuminate').next_reference{wrap=true}<cr>", "Go to next occurrence" },
              p = { "<cmd>lua require('illuminate').next_reference{reverse=true,wrap=true}<cr>", "Go to previous occurrence" },
              r = { "<cmd>lua vim.lsp.buf.references()<cr>", "Go to references" },
              -- t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Go to type definition" },
              ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" }
            },
            ["["] = {
              d = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
            },
            ["]"] = {
              d = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous Diagnostic" },
            },
          }, { buffer = buffer, mode = "n", noremap = true, silent = true })

          which_key.register({
            w = {
              name = "Workspace",
              a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add workspace" },
              l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List workspaces" },
              r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove workspace" },
            },
            c = {
              name = "Code",
              a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Action" },
              f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
              r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
            }
          }, { buffer = buffer, mode = "n", prefix = "<leader>", noremap = true, silent = true })

          if client.name == "tsserver" then
            which_key.register({
              c = {
                name = "Code",
                a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Action" },
                f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
                r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
                i = {
                  name = "Imports",
                  o = { "<cmd>OrganizeImports<cr>", "Organize" },
                },
              }
            }, { buffer = buffer, mode = "n", prefix = "<leader>", noremap = true, silent = true })
          end
        end
      '';

      servers = {
        ansiblels.enable = true;
        astro.enable = true;
        bashls.enable = true;
        clojure-lsp.enable = true;
        cssls.enable = true;
        dartls.enable = true;
        denols.enable = true;
        dockerls.enable = true;
        elixirls.enable = true;
        elmls.enable = true;
        emmet_ls.enable = true;
        eslint = {
          enable = true;
          extraOptions.settings.autoFixOnSave = true;
        };
        gleam.enable = true;
        graphql.enable = true;
        gopls.enable = true;
        hls.enable = true;
        html.enable = true;
        htmx.enable = true;
        java-language-server.enable = true;
        jsonls.enable = true;
        kotlin-language-server.enable = true;
        leanls.enable = true;
        lua-ls.enable = true;
        ltex.enable = true;
        ltex.settings = {
          checkFrequency = "save";
          enabled = [
            "bibtex"
            "context"
            "context.tex"
            "html"
            "latex"
            "markdown"
            "org"
            "restructuredtext"
            "rsweave"
            "neorg"
          ];
          statusBarItem = true;
        };
        marksman.enable = true;
        nushell.enable = true;
        prismals.enable = true;
        pylsp.enable = true;
        ruff-lsp.enable = true;
        rust-analyzer = {
          installCargo = true;
          installRustc = true;
          enable = true;
        };
        svelte.enable = true;
        tailwindcss.enable = true;
        taplo.enable = true;
        terraform.enable = true;
        texlab.enable = true;
        typst-lsp.enable = true;
        volar.enable = true;
        yamlls.enable = true;
        zls.enable = true;

        tsserver = {
          enable = true;

          extraOptions = {
            commands = {
              OrganizeImports = lua.mkRaw ''
                {
                  function()
                    vim.lsp.buf.execute_command {
                      title = "",
                      command = "_typescript.organizeImports",
                      arguments = { vim.api.nvim_buf_get_name(0) },
                    }
                  end,
                  description = "Organize Imports",
                }
              '';
            };
          };
        };
      };
    };
  };

  extraConfigLuaPre = ''
    do
      local diagnostic_signs = { Error = "", Warn = "", Hint = "", Info = "" }

      for type, icon in pairs(diagnostic_signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      })
    end
  '';
}
