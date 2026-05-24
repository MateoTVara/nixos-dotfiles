{ ... }:

{
  programs.waybar = {
    enable = true;
    settings.main = {
      layer = "top";
      spacing = 0;
      height = 0;
      margin-bottom = 0;
      margin-top = 0;
      margin-right = 175;
      margin-left = 175;
      position = "top";

      modules-left = [
        "custom/power"
        "custom/screenshot"
        "niri/workspaces"
        "bluetooth"
      ];

      modules-center = [
        "custom/applauncher"
      ];

      modules-right = [
        "network"
        "battery"
        "pulseaudio"
        "tray"
        "clock"
      ];

      "custom/power" = {
        format = "󰐥";
        tooltip = "Power Menu";
        menu = "on-click";
        menu-file = ./menus/power_menu.xml;
        menu-actions = {
          shutdown = "shutdown now";
          reboot = "reboot";
          logout = "niri msg action quit";
        };
      };

      "custom/screenshot" = {
        format = "󰄀";
        tooltip = "Screenshot (copy to clipboard)";
        on-click = "grim -g \"$(slurp)\" - | wl-copy";
        on-click-right = "grim - | wl-copy";
      };

      "niri/workspaces" = {
        disable-scroll = true;
        all-outputs = false;
        tooltip = false;
      };

      "bluetooth" = {
        format = " {status}";
        format-disabled = "";
        format-connected = " {num_connections}";
      };

      "custom/applauncher" = {
        format = "〇";
        on-click = "pgrep wofi >/dev/null 2>&1 && killall wofi || wofi --show drun --location=top -y 8";
        tooltip = false;
      };

      network = {
        format-wifi = "  {bandwidthDownBits}";
        format-ethernet = "  {bandwidthDownBits}";
        format-disconnected = "󰤮 No Network";
        interval = 5;
        tooltip = false;
      };

      battery = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-charging = "󰂄 {capacity}%";
        format-plugged = "󰂄{capacity}%";
        format-alt = "{icon} {time}";
        format-full = "󱈑 {capacity}%";
        format-icons = [
          "󱊡"
          "󱊢"
          "󱊣"
        ];
      };

      pulseaudio = {
        scroll-step = 5;
        max-volume = 150;
        format = "{icon} {volume}%";
        format-bluetooth = "{icon} {volume}%";
        format-icons = [
          ""
          ""
          " "
        ];
        nospacing = 1;
        format-muted = " ";
        on-click = "pavucontrol";
        tooltip = false;
      };

      tray = {
        spacing = 10;
        tooltip = false;
      };

      clock = {
        format = "󰅐 {:%H:%M}";
        tooltip = false;
      };
    };
  };

  xdg.configFile."waybar/style.css".source = ./style.css;
  xdg.configFile."waybar/styles".source = ./styles;
}
