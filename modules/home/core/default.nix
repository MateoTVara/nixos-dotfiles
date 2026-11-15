{ osConfig, ... }:
{
  imports = [
    ./qt.nix
    ./sops.nix
  ];

  home.stateVersion = osConfig.system.stateVersion;

  services = {
    polkit-gnome.enable = true;
    network-manager-applet.enable = true;
    awww.enable = true;
  };
}
