{ config, pkgs, ... }:

{
  sops.secrets = {
    ssh_marun_private = {
      path = "/home/marun/.ssh/id_ed25519";
      mode = "0600";
    };

    ssh_marun_public = {
      path = "/home/marun/.ssh/id_ed25519.pub";
      mode = "0644";
    };
  };

  programs.ssh = {
    enable = true;
    # addKeysToAgent = "yes";

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

    # matchBlocks = {
    #   "github.com" = {
    #     host = "github.com";
    #     user = "git";
    #     identityFile = "~/.ssh/id_ed25519";
    #   };
    # };
  };
}