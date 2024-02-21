{lib, ...}:
with lib;
with lib.plusultra; {
  autoGroups.macro_recording.clear = true;
  autoCmd = [
    {
      event = "RecordingEnter";
      pattern = "*";
      callback =
        lua.mkRaw
        "function() require('lualine').refresh({ place = { 'statusline' } }) end";
    }
    {
      event = "RecordingLeave";
      pattern = "*";
      callback = lua.mkRaw ''
        function()
          local timer = vim.loop.new_timer()
          timer:start(
            50,
            0,
            vim.schedule_wrap(function() require('lualine').refresh({ place = { 'statusline' } }) end)
          )
        end
      '';
    }
  ];
}
