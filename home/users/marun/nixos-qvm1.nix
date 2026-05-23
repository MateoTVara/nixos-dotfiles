{ config, pkgs, ... }:
{
  sops.secrets = {
    "users/marun/ssh/qvm1/private" = {
      path = "/home/marun/.ssh/id_ed25519";
      mode = "0600";
    };
    "users/marun/ssh/qvm1/public" = {
      path = "/home/marun/.ssh/id_ed25519.pub";
      mode = "0644";
    };
  };
}