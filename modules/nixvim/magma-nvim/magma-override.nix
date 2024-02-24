{
  pkgs,
  lib,
  ...
}:
pkgs.vimUtils.buildVimPlugin {
  pname = "magma-nvim";
  version = "2024-02-23";
  src = pkgs.fetchFromGitHub {
    owner = "dccsillag";
    repo = "magma-nvim";
    rev = "ff3deba8a879806a51c005e50782130246143d06";
    sha256 = lib.fakeSha256;
  };
  passthru.python3Dependencies = ps:
    with ps; [
      pynvim
      jupyter-client
      ueberzug
      pillow
      cairosvg
      plotly
      ipykernel
      pyperclip
      pnglatex
    ];
  meta.homepage = "https://github.com/dccsillag/magma-nvim";
}
