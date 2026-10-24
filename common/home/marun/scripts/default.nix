{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "rofi-project-launcher";
      runtimeInputs = with pkgs; [
        alacritty
        rofi
        tmux
      ];
      text = builtins.readFile ./rofi-project-launcher.sh;
    })
  ];

  # ~/.local/share/
  xdg.dataFile = {
    "templates" = {
      source = ./templates;
      recursive = true;
    };
  };
}
