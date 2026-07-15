{ ... }:

{
  home.file = {
    ".local/bin/rofi_project-launcher.sh" = {
      source = ./rofi_project-launcher.sh;
      executable = true;
    };
  };

  # ~/.local/share/
  xdg.dataFile = {
    "templates" = {
      source = ./templates;
      recursive = true;
    };
  };
}
