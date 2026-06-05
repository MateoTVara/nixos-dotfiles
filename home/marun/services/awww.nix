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
in
{
  services.awww = {
    enable = true;
    extraArgs = [
      "-n"
      "wallpaper"
    ];
  };

  systemd.user.services.awww-wallpaper = {
    Unit = {
      Description = "Set wallpaper";
      After = [ "awww.service" ];
      Requires = [ "awww.service" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.awww}/bin/awww img -n wallpaper ${selectedWallpaper}";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
