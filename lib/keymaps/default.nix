{ ... }: {
  keymap = {
    fromNixvim = keymap: ''
      vim.keymap.set("${keymap.mode}", "${keymap.key}", "${keymap.action}",
        { ${builtins.mapAttrs (name: value: "${name}: ${value},")} })
    '';
  };
}
