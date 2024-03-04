{
  pkgs,
  lib,
  ...
}: {
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
      passthru.python3Dependencies = ps:
        with ps; [
          pynvim
          jupyter-client
          cairosvg
          ipython
          nbformat
        ];
      meta.homepage = "https://github.com/benlubas/molten-nvim/";
    };
    settings = {image_provider = "image.nvim";};
  };

  extraPackages = with pkgs.python311Packages; [
    pynvim
    jupyter-client
    cairosvg
    ipython
    nbformat
  ];

  # extraConfigLuaPost = ''
  #   require('molten')
  # '';
}
