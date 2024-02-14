{lib, ...}:
with lib.plusultra; {
  plugins.neorg = {
    enable = true;
    lazyLoading = true;

    modules = {
      "core.defaults" = {};
      "core.dirman" = {
        config = {
          workspaces = {
            home = "~/notes/home";
            work = "~/notes/work";
          };
          index = "index.norg";
        };
      };
      "core.completion" = {config = {engine = "nvim-cmp";};};
      "core.concealer" = {
        config = {
          folds = true;
          icon_preset = "diamond";
        };
      };
      "core.presenter" = {config = {zen_mode = "zen-mode";};};
      "core.export" = {
        config = {export_dir = "<export-dir>/<language>-export";};
      };
      "core.export.markdown" = {
        config = {
          extension = "md";
          extensions = "all";
        };
      };
      "core.summary" = {config = {strategy = "default";};};
      "core.ui.calendar" = {};
    };
  };
}
