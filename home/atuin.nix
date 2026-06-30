{...}: {
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [];
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      sync_address = "https://api.atuin.sh";
      search_mode = "fuzzy";
      db_path = "~/secrets/atuin/.history.db";
      key_path = "~/secrets/atuin/atuin.key";
      session_path = "~/.atuin-session";
      update_check = true;
      # filter_mode = "host";
      search_mode_shell_up_keybinding = "fuzzy";
      filter_mode_shell_up_keybinding = "session";
      # workspaces = true;
      style = "full";
      invert = true;
      # inline_height = 40;
      show_preview = true;
      # max_preview_height = 4;
      show_help = true;
      show_tabs = true;
      # auto_hide_height = 8;
      exit_mode = "return-original";
      # history_format = "history_list";
      # history_filter = [];
      # cwd_filter = [];
      store_failed = true;
      secrets_filter = true;
      network_timeout = 30;
      network_connect_timeout = 5;
      local_timeout = 5;
      command_chaining = false;
      enter_accept = false;
      keymap_mode = "vim-normal";
      keymap_cursor = {
        emacs = "blink-block";
        vim_insert = "blink-block";
        vim_normal = "steady-block";
      };
      prefers_reduced_motion = false;
    };
    themes = {};
  };
}
