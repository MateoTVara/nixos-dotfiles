{ ... }:

{
  imports = [
    ./theme.nix
  ];

  programs.rofi = {
    enable = true;
    font = "Maple Mono 11.25";
    terminal = "alacritty";
    extraConfig = {
      modi = "drun";
      show-icons = true;
      drun-display-format = "{name}";
      display-drun = "󰍉";
      case-sensitive = false;
    };
  };
}
