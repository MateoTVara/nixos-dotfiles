{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;

    enableDefaultConfig = false;

    settings = {
      "*" = {
        AddKeysToAgent = "yes";
      };

      "github.com" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/.ssh/id_ed25519";
      };
    };
  };

  home.file.".ssh/known_hosts" = {
    text = ''
      github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl
      nixos-qvm1 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE8siICPLS0ELqVE5xFWikQvazLO54mZHGn0PtFop+6i
      nixos-qvm2 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPExP7QFSFDeLREzFPA9IAQPhiUGLmVJ2MfCjfG156dh
    '';
  };
}