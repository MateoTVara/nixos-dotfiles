{ ... }:

{
  programs.zed-editor.userSettings = {
    cli_default_open_behavior = "new_window";
    ui_font_size = 16;
    buffer_font_size = 15;

    project_panel = {
      dock = "left";
      indent_size = 12;
    };

    icon_theme = {
      mode = "dark";
      light = "Symbols Icon Theme";
      dark = "Symbols Icon Theme";
    };

    theme = {
      mode = "system";
      light = "Gruvbox Light";
      dark = "Gruvbox Dark";
    };

    languages = {
      LaTeX = {
        soft_wrap = "editor_width";
      };
    };
  };
}
