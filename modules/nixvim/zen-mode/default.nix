{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [twilight-nvim zen-mode-nvim];
}
