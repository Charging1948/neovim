{pkgs, ...}:
pkgs.vimUtils.buildVimPlugin {
  pname = "magma-nvim";
  version = "2023-03-13";
  src = pkgs.fetchFromGitHub {
    owner = "dccsillag";
    repo = "magma-nvim";
    rev = "ff3deba8a879806a51c005e50782130246143d06";
    sha256 = "10d6dh0czdpgfpzqs5vzxfffkm0460qjzi2mfkacgghqf3iwkbja";
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
