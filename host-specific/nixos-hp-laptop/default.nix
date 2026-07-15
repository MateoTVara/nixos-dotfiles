{ hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];
  # networking.hostName = "nixos-hp-laptop";
  networking.hostName = hostname;
  custom.wallpaper = "/home/marun/Pictures/wallpapers/Ranni_HP.jpg";
}
