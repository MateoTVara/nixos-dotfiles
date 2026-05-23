# Not sure if this works ':(
{ config, lib, pkgs, ... }:
{
  networking.networkmanager.enable = true;

  sops.secrets = {
    "wifi/TOBAR-5G_psk" = {};
    "wifi/TOBAR-2.4G_psk" = {};
  };

  system.activationScripts.networkmanager.text = ''
    mkdir -p /etc/NetworkManager/system-connections

    cat > /etc/NetworkManager/system-connections/TOBAR-5G.nmconnection <<EOF
    [connection]
    id=TOBAR-5G
    type=wifi
    autoconnect=true

    [wifi]
    mode=infrastructure
    ssid=TOBAR-5G

    [wifi-security]
    key-mgmt=wpa-psk
    psk=$(cat ${config.sops.secrets."wifi/TOBAR-5G_psk".path})

    [ipv4]
    method=auto

    [ipv6]
    method=auto
    EOF

    chmod 600 /etc/NetworkManager/system-connections/TOBAR-5G.nmconnection

    cat > /etc/NetworkManager/system-connections/TOBAR-2.4G.nmconnection <<EOF
    [connection]
    id=TOBAR-2.4G
    type=wifi
    autoconnect=true

    [wifi]
    mode=infrastructure
    ssid=TOBAR-2.4G

    [wifi-security]
    key-mgmt=wpa-psk
    psk=$(cat ${config.sops.secrets."wifi/TOBAR-2.4G_psk".path})

    [ipv4]
    method=auto

    [ipv6]
    method=auto
    EOF

    chmod 600 /etc/NetworkManager/system-connections/TOBAR-2.4G.nmconnection
  '';
}