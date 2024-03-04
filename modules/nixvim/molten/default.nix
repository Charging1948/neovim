{ pkgs, ... }: {
  plugins.molten = {
    enable = true;
    settings = { image_provider = "image.nvim"; };
  };
}
