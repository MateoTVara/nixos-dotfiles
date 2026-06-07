{ config, lib, pkgs, ... }:
let
  mkProfile = name: pskEnv: {
    connection = {
      id = name;
      type = "wifi";
      autoconnect = true;
    };
    wifi = {
      mode = "infrastructure";
      ssid = name;
    };
    wifi-security = {
      key-mgmt = "wpa-psk";
      psk = "$" + pskEnv;
    };
    ipv4.method = "auto";
    ipv6.method = "auto";
  };
in
{
  networking.networkmanager = {
    enable = true;
    ensureProfiles = {
      environmentFiles = [
        config.sops.secrets."wifi/env".path
      ];
      profiles = {
        "TOBAR-5G"   = mkProfile "TOBAR-5G"   "TOBAR_5G_PSK";
        "TOBAR-2.4G" = mkProfile "TOBAR-2.4G" "TOBAR_2_DOT_4G_PSK";
      };
    };
  };
}