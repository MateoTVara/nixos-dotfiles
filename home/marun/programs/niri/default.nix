{
  pkgs,
  extraArgs,
  ...
}:
let
  hostname = extraArgs.hostname or "unknown";

  wallpapers = {
    "nixos-qvm1" = "/home/marun/Pictures/wallpapers/Ranni.jpg";
    "nixos-qvm2" = "/home/marun/Pictures/wallpapers/Ranni.jpg";
    "nixos-hp-laptop" = "/home/marun/Pictures/wallpapers/Ranni_HP.jpg";
    "default" = "/home/marun/Pictures/wallpapers/Ranni.jpg";
  };

  selectedWallpaper = wallpapers.${hostname} or wallpapers.default;

  renderedConfig = pkgs.replaceVars ./config/config.kdl.template {
    WALLPAPER_PATH = selectedWallpaper;
  };
in
{
  # xdg.configFile."niri/config.kdl".source = renderedConfig;
  # xdg.configFile."niri/window-rules".source = ./config/window-rules;
  # xdg.configFile."niri/binds.kdl".source = ./config/binds.kdl;
  # xdg.configFile."niri/input.kdl".source = ./config/input.kdl;
  # xdg.configFile."niri/layout.kdl".source = ./config/layout.kdl;
  # xdg.configFile."niri/output.kdl".source = ./config/output.kdl;
  xdg.configFile."niri".source = ./config;
}
