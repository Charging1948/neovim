{pkgs, ...}: {
  extraPlugins = with pkgs; [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "vim-mdx-js";
      version = "2024-03-06";
      src = pkgs.fetchFromGitHub {
        owner = "jxnblk";
        repo = "vim-mdx-js";
        rev = "17179d7f2a73172af5f9a8d65b01a3acf12ddd50";
        # sha256 = lib.fakeSha256;
        sha256 = "wfYCvw9JVGG8p8PQhRPT6CeGGf2OVz9SR2KQM0LjQhY=";
      };
      meta.homepage = "https://github.com/jxnblk/vim-mdx-js";
    })
  ];

  filetype = {extension.mdx = "markdown.mdx";};

  extraFiles = {
    "queries/markdown.mdx/injections.scm" = builtins.readFile ./injections.scm;
    "queries/markdown.mdx/highlights.scm" = builtins.readFile ./highlights.scm;
  };
}
