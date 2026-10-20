{ ... }:

{
  imports = [
    ./theme.nix
  ];

  programs.rofi = {
    enable = true;
    settings = {
      font = "Maple Mono 11.25";
      terminal = "alacritty";
      modi = "drun";
      show-icons = true;
      drun-display-format = "{name}";
      display-drun = "󰍉";
      case-sensitive = false;
    };
  };
}
