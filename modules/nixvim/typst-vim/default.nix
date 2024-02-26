{
  pkgs,
  lib,
  ...
}: {
  plugins.typst-vim.enable = true;
  plugins.typst-vim.extraConfig.pdf_viewer = "${pkgs.zathura}/bin/zathura";
}
