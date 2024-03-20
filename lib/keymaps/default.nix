_: {
  keymaps = {
    fromNixvim = keymap:
      let
        opts_list = builtins.attrValues
          (builtins.mapAttrs (name: value: "${name} = ${builtins.toJSON value}")
            keymap.options);
        opts_string = builtins.concatStringsSep ", " opts_list;
      in
      ''
        vim.keymap.set("${keymap.mode}", "${keymap.key}", "${keymap.action}",
          { ${opts_string} })
      '';
  };
}
