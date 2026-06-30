{
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 11;
    };
    environment = {
      "KITTY_ENABLE_WAYLAND" = "1";
    };
    keybindings = {
      "ctrl+shift+left" = "no_op";
      "ctrl+shift+right" = "no_op";
      "ctrl+shift+home" = "no_op";
      "ctrl+shift+end" = "no_op";
    };
    shellIntegration = {
      enableZshIntegration = true;
    };
    settings = {
      wayland_titlebar_color = "system";
      hide_window_decorations = "no";
      font_family = "FiraCode Nerd Font";
      bold_font = "       auto";
      italic_font = "     auto";
      bold_italic_font = "auto";
      shell_integration = "disabled";
      font_size = "11.0";
      background_opacity = "0.6";
      window_padding_width = "0";
      confirm_os_window_close = "0";
      foreground = "#a6accd";
      background = "#0d0f16";
      color0 = "#1b1e28";
      color8 = "#a6accd";
      color1 = "#d0679d";
      color9 = "#d0679d";
      color2 = " #5de4c7";
      color10 = "#5de4c7";
      color3 = " #fffac2";
      color11 = "#fffac2";
      color4 = " #89ddff";
      color12 = "#add7ff";
      color5 = " #fcc5e9";
      color13 = "#fae4fc";
      color6 = " #add7ff";
      color14 = "#89ddff";
      color7 = " #ffffff";
      color15 = "#ffffff";
      cursor = "#ffffff";
      cursor_text_color = "#1b1e28";
      cursor_shape = "beam";
      selection_foreground = "none";
      selection_background = "#28344a";
      url = "color #5de4c7";
      active_border_color = "#3d59a1";
      inactive_border_color = "#101014";
      bell_border_color = "#fffac2";
      tab_bar_style = "fade";
      tab_fade = "1";
      active_tab_foreground = "  #3d59a1";
      active_tab_background = "  #16161e";
      active_tab_font_style = "  bold";
      inactive_tab_foreground = "#787c99";
      inactive_tab_background = "#16161e";
      inactive_tab_font_style = "bold";
      tab_bar_background = "#101014";
      macos_titlebar_color = "#16161e";
      KITTY_ENABLE_WAYLAND = "1";
    };
  };
}
