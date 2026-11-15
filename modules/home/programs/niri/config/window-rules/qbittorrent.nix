{ ... }:
{
  wayland.windowManager.niri.settings._children = [
    {
      window-rule = {
        match._props = {
          app-id = "org.qbittorrent.qBittorrent";
          title = "qBittorrent v5.2.0";
        };
        default-column-width.proportion = 0.75;
      };
    }
  ];
}
