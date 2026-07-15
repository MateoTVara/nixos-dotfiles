{ hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];
  # networking.hostName = "nixos-qvm2";
  networking.hostName = hostname;
  custom.wallpaper = "/home/marun/Pictures/wallpapers/Ranni.jpg";
}
