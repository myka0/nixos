{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    themeFile = "GruvboxMaterialDarkHard";

    font = {
      name = "JetBrainsMonoNL NF Regular";
      package = pkgs.jetbrains-mono;
      size = 10;
    };

    settings = {
      # Window and Layout
      confirm_os_window_close = 0;
      enabled_layouts = "grid";
      initial_window_height = 540;
      initial_window_width = 960;
      remember_window_size = false;
      scrollback_lines = 5000;
      sync_to_monitor = false;
      disable_ligatures = "never";

      # Cursor
      cursor_blink_interval = -1;
      cursor_shape = "underline";
      cursor_stop_blinking_after = 15;
      copy_on_select = true;
      strip_trailing_spaces = "smart";
      selection_background = "#80415e";
      selection_foreground = "#ebdbb2";
      url_color = "#b16286";
      cursor = "#ebdbb2";

      # Tab Bar
      active_tab_background = "#7aa2f7";
      active_tab_foreground = "#1f2335";
      inactive_tab_background = "#292e42";
      inactive_tab_foreground = "#545c7e";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";

      # Window
      active_border_color = "#6791C9";
      inactive_border_color = "#1D2021";
      window_border_width = 2;
      window_padding_width = 12;
    };

    keybindings = {
      # Scrolling
      "alt+up" = "scroll_line_up";
      "alt+k" = "scroll_line_up";
      "alt+down" = "scroll_line_down";
      "alt+j" = "scroll_line_down";
      "alt+page_up" = "scroll_page_up";
      "alt+page_down" = "scroll_page_down";
      "alt+home" = "scroll_home";
      "alt+end" = "scroll_end";
      "alt+h" = "show_scrollback";

      # Window Management
      "alt+enter" = "new_window";
      "alt+w" = "close_window";
      "alt+]" = "next_window";
      "alt+[" = "previous_window";
      "alt+f" = "move_window_forward";
      "alt+b" = "move_window_backward";
      "alt+`" = "move_window_to_top";
      "alt+r" = "start_resizing_window";
      "alt+1" = "first_window";
      "alt+2" = "second_window";
      "alt+3" = "third_window";
      "alt+4" = "fourth_window";
      "alt+5" = "fifth_window";
      "alt+6" = "sixth_window";
      "alt+7" = "seventh_window";
      "alt+8" = "eighth_window";
      "alt+9" = "ninth_window";
      "alt+0" = "tenth_window";

      # Tab Management
      "alt+right" = "next_tab";
      "alt+left" = "previous_tab";
      "alt+t" = "new_tab";
      "alt+q" = "close_tab";
      "alt+." = "move_tab_forward";
      "alt+," = "move_tab_backward";
      "alt+shift+t" = "set_tab_title";
      "alt+l" = "next_layout";

      # Font Size
      "alt+equal" = "change_font_size all +2.0";
      "alt+minus" = "change_font_size all -2.0";
      "alt+backspace" = "change_font_size all 0";
    };
  };
}
