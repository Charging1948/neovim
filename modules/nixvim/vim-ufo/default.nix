{
  pkgs,
  config,
  ...
}: {
  config = {
    plugins.vim-ufo.enable = true;

    options = {
      foldlevel = 99;
      foldlevelstart = 99;
    };
  };
}
