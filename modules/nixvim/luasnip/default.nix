_: {
  plugins = {
    friendly-snippets = {enable = true;};
    luasnip = {
      enable = true;
      fromLua = [{paths = "./snippets";}];
      fromVscode = [{}];
      extraConfig = {
        history = true;

        updateevents = "TextChanged,TextChangedI";

        enable_autosnippets = true;

        ext_opts = {
          "types.choiceNode" = {
            active = {virt_text = [["<-" "Error"]];};
          };
        };
      };
    };
  };
}
