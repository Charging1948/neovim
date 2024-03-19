{ pkgs, lib, ... }:
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
}
