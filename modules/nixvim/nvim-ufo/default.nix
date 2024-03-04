{
  pkgs,
  config,
  ...
}: {
  config = {
    plugins.nvim-ufo.enable = true;

    options = {
      foldlevel = 99;
      foldlevelstart = 99;
    };
  };
}
