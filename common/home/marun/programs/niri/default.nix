{ pkgs, osConfig, ... }:
let
  # hostname = osConfig.networking.hostName or "unknown";

  # wallpapers = {
  #   "nixos-qvm1" = "/home/marun/Pictures/wallpapers/Ranni.jpg";
  #   "nixos-qvm2" = "/home/marun/Pictures/wallpapers/Ranni.jpg";
  #   "nixos-hp-laptop" = "/home/marun/Pictures/wallpapers/Ranni_HP.jpg";
  #   "default" = "/home/marun/Pictures/wallpapers/Ranni.jpg";
  # };

  # selectedWallpaper = wallpapers.${hostname} or wallpapers.default;

  # renderedConfig = pkgs.replaceVars ./config/config.template.kdl {
  #   WALLPAPER_PATH = selectedWallpaper;
  # };
  renderedConfig = pkgs.replaceVars ./config/config.template.kdl {
    WALLPAPER_PATH = osConfig.custom.wallpaper;
  };
in
{
  xdg.configFile."niri/config.kdl".source = renderedConfig;
  xdg.configFile."niri/window-rules".source = ./config/window-rules;
  xdg.configFile."niri/binds.kdl".source = ./config/binds.kdl;
  xdg.configFile."niri/input.kdl".source = ./config/input.kdl;
  xdg.configFile."niri/layout.kdl".source = ./config/layout.kdl;
  xdg.configFile."niri/output.kdl".source = ./config/output.kdl;
}
