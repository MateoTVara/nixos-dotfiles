{ config, ... }:
let
  enable = name: {
    inherit name;
    value.enable = true;
  };
in
{
  imports = [
    ./pictures
    ./programs
    ./scripts
  ];

  sops = {
    age.keyFile = "/home/marun/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    secrets = {
      "wakatime_cfg" = {
        path = "${config.home.homeDirectory}/.wakatime.cfg";
        key = "wakatime_cfg";
      };
    };
  };

  home = {
    username = "marun";
    homeDirectory = "/home/marun";

    stateVersion = "25.11";
  };

  services =
    (builtins.listToAttrs (
      map enable [
        "polkit-gnome"
        "network-manager-applet"
        "awww"
      ]
    ))
    // { };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      name = "adwaita-dark";
    };
  };
}
