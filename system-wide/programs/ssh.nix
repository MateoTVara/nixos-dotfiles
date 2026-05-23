{ pkgs, ... }:

{
  programs.ssh = {
    knownHosts = {
      # System Wide Known Hosts
    };
  };
  services.openssh.enable = true;
}