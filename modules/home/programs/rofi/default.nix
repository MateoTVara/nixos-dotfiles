{ config, lib, pkgs, ... }:
let
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;

  cfg = config.sva.programs.rofi;
in
{
  options.sva.programs.rofi.enable = mkEnableOption "rofi";

  imports = [
    ./theme.nix
  ];

  config = mkIf cfg.enable {
    home.packages = [
      (pkgs.writeShellApplication {
        name = "rofi-project-launcher";
        runtimeInputs = with pkgs; [
          alacritty
          rofi
          tmux
        ];
        text = builtins.readFile ./scripts/rofi-project-launcher.sh;
      })
    ];

    xdg.dataFile = {
      "templates/launch.sh".source = ./scripts/launch.sh;
    };

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
  };
}
