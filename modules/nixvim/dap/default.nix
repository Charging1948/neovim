{ ... }: {
  plugins = {
    dap = {
      enable = true;

      extensions = {
        dap-ui.enable = true;
        dap-go.enable = true;
        dap-python.enable = true;
        dap-virtual-text.enable = true;
      };
    };
  };

  keymaps = [
    {
      key = "<leader>dt";
      action = "<cmd>DapToggleBreakpoint<CR>";
      options.desc = "Toggle Breakpoint";
    }
    {
      key = "<leader>dc";
      action = "<cmd>DapContinue<CR>";
      options.desc = "Dap Continue";
    }
  ];
}
