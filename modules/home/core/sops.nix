{ config, ... }:
{
  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    secrets = {
      "wakatime_cfg" = {
        path = "${config.home.homeDirectory}/.wakatime.cfg";
        key = "wakatime_cfg";
      };
    };
  };
}
