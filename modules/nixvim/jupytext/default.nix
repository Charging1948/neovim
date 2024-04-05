{ pkgs, ... }:
let
  pyPacks = p: with p; [ jupytext ];
  jupytext-package = pkgs.vimUtils.buildVimPlugin {
    pname = "jupytext-nvim";
    version = "2024-03-04";
    src = pkgs.fetchFromGitHub {
      owner = "GCBallesteros";
      repo = "jupytext.nvim";
      rev = "68fddf28119dbaddfaea6b71f3d6aa1e081afb93";
      # sha256 = lib.fakeSha256;
      sha256 = "x5emW+qfUTUDR72B9QdDgVdrb8wGH9D7AdtRrQm80sI=";
    };
    passthru.python3Dependencies = pyPacks;
    meta.homepage = "https://github.com/GCBallesteros/jupytext.nvim";
  };
in
{
  extraPython3Packages = pyPacks;

  plugins.jupytext = {
    enable = true;
    package = jupytext-package;
    settings = {
      custom_language_formatting = {
        python = {
          extension = "qmd";
          style = "quarto";
          force_ft = true;
        };
      };
    };
  };
}
