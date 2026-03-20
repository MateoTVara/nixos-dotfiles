# users/marun/default.nix
{ config, pkgs, ... }:

{
  home.username = "marun";
  home.homeDirectory = "/home/marun";
  home.stateVersion = "25.11";

  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age.keyFile = "/home/marun/.config/sops/age/keys.txt";
    secrets = {
      wakatime = {
        path = "${config.home.homeDirectory}/.wakatime.cfg";
        key = "wakatime_cfg";
      };
    };
  };

  imports = [
    ./vscode
    ./git.nix
  ];
}
