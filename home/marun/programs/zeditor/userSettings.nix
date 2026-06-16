{ ... }:
{
  programs.zed-editor.userSettings = {
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

    lsp = {
      wakatime = {
        initialization_options = {
          api-key = "__WAKATIME_API_KEY__";
        };
      };
    };
  };
}
