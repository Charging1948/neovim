{
  pkgs,
  lib,
  ...
}: {
  plugins.typst-vim.enable = true;
  plugins.typst-vim.settings.pdf_viewer = "${pkgs.zathura}/bin/zathura";
}
