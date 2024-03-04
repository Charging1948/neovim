{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [twilight-nvim zen-mode-nvim];

  extraConfigLuaPost = ''
    require('zen-mode').setup({
      plugins = {
        kitty = { enabled = true },
      }
    })
  '';
}
