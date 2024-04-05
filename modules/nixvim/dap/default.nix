{ ... }: {
  plugins = {
    dap = {
      enable = true;

      extensions = {
        dap-go.enable = true;
        dap-python.enable = true;

        # TODO: Re-enable once issue with dap-nio dependency is resolved
        dap-ui.enable = false;
        dap-virtual-text.enable = false;
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
