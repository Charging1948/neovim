{ pkgs, lib, ... }:
with lib;
with lib.plusultra;
let
  pyPacks = p:
    with p; [
      pynvim
      jupyter-client
      ipykernel
      cairosvg
      ipython
      nbformat
    ];
  default_opts = {
    buffer = true;
    silent = true;
  };

  buffer_keymaps = [
    {
      key = "<localleader>mo";
      action = "<cmd>:MoltenEvaluateOperator<CR>";
      options = { desc = "[m]olten - evaluate [o]perator"; } // default_opts;
      mode = "n";
    }
    {
      key = "<localleader>ml";
      action = "<cmd>:MoltenEvaluateLine<CR>";
      options = { desc = "[m]olten - evaluate [l]ine"; } // default_opts;
      mode = "n";
    }
    {
      key = "<localleader>mc";
      action = "<cmd>:MoltenReevaluateCell<CR>";
      options = { desc = "[m]olten - evaluate [c]ell"; } // default_opts;
      mode = "n";
    }
    {
      key = "<localleader>m";
      action = ":<C-u>MoltenEvaluateVisual<CR>gv";
      options = {
        desc = "[m]olten - evaluate visual selection";
      } // default_opts;
      mode = "v";
    }
    {
      key = "<localleader>md";
      action = "<cmd>:MoltenDelete<CR>";
      options = { desc = "[m]olten - [d]elete cell"; } // default_opts;
      mode = "n";
    }
    {
      key = "<localleader>mh";
      action = "<cmd>:MoltenHideOutput<CR>";
      options = { desc = "[m]olten - [h]ide output"; } // default_opts;
      mode = "n";
    }
    {
      key = "<localleader>ms";
      action = "<cmd>:noautocmd MoltenHideOutput<CR>";
      options = { desc = "[m]olten - [s]how/enter output"; } // default_opts;
      mode = "n";
    }
  ];
in
{
  plugins.molten = {
    enable = true;
    package = pkgs.vimUtils.buildVimPlugin {
      pname = "molten-nvim";
      version = "2024-02-23";
      src = pkgs.fetchFromGitHub {
        owner = "benlubas";
        repo = "molten-nvim";
        rev = "8346bba69e0de96278dad2038e9be74605908b7d";
        # sha256 = lib.fakeSha256;
        sha256 = "08f3zxzka43f87fks56594476h57yq01x7a1zdsn4acc278xg1nb";
      };
      passthru.python3Dependencies = pyPacks;
      meta.homepage = "https://github.com/benlubas/molten-nvim/";
    };
    settings = { image_provider = "image.nvim"; };
  };

  extraPython3Packages = pyPacks;

  keymaps = [{
    key = "<leader>mi";
    action = "<cmd>:MoltenInit<CR>";
    mode = "n";
    options = {
      desc = "Initialize Molten for current buffer";
      silent = true;
    };
  }];

  extraConfigLuaPost = ''
    vim.api.nvim_create_autocmd("User", {
      pattern = "MoltenInitPost",
      callback = function()
        ${toString (map (x: keymaps.fromNixvim x) buffer_keymaps)}
      end,
    })
  '';
}
