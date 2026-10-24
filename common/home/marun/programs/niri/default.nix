{ osConfig, ... }:
{
  imports = [
    ./config
  ];

  wayland.windowManager.niri = {
    enable = true;
    settings = {
      layer-rule = {
        match._props.namespace = "^awww-daemonwallpaper$";
        place-within-backdrop = true;
      };

      _children = [
        {
          spawn-at-startup = [
            "awww-daemon"
            "-n"
            "wallpaper"
          ];
        }
        {
          spawn-at-startup = [
            "awww"
            "img"
            "-n"
            "wallpaper"
            osConfig.custom.wallpaper
          ];
        }
        { spawn-at-startup = [ "qbittorrent" ]; }
      ];

      hotkey-overlay = { };
      prefer-no-csd = { };

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
      animations = { };

      environment = {
        QT_QPA_PLATFORM = "wayland";
        GDK_DPI_SCALE = "0.9";
        GTK_THEME = "Adwaita:dark";
        NIXOS_OZONE_WL = "1";
      };
    };
  };
}
