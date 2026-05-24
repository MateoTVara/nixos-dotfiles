{ pkgs, ... }:
let
  enable = name: {
    inherit name;
    value.enable = true;
  };

  source = {
    dot = path: {
      name = ".${path}";
      value.source = ./dot + "/${path}";
    };
    dotConfig = path: {
      name = path;
      value.source = ./dot/config + "/${path}";
    };
  };
in
{
  imports = [
    ./programs/vscode
    ./programs/firefox.nix
    ./programs/wofi.nix
    ./programs/kitty.nix
    ./programs/zsh.nix
    ./programs/git.nix
    ./programs/ssh.nix
    ./programs/nvf.nix
    ./programs/fastfetch
    ./programs/waybar
    ./programs/niri
    ./programs/tmux
  ];

  sops = {
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

    defaultSopsFile = ../../secrets/secrets.yaml;

    defaultSopsFormat = "yaml";
  };

  home = {
    username = "marun";
    homeDirectory = "/home/marun";

    packages = with pkgs; [
      tree
      wl-clipboard
      grim
      slurp
    ];

    stateVersion = "25.11";
  };

  programs =
    (builtins.listToAttrs (
      map enable [

      ]
    ))
    // { };

  services =
    (builtins.listToAttrs (
      map enable [
        "awww"
        "polkit-gnome"
      ]
    ))
    // { };

  home.file = {
    "Pictures/wallpapers".source = ./Pictures/wallpapers;
  }
  //
    # /home/marun/.<file or directory>
    (builtins.listToAttrs (
      map source.dot [

      ]
    ));

  xdg = {
    # /home/marun/.config/<file or directory>
    configFile = (
      builtins.listToAttrs (
        map source.dotConfig [

        ]
      )
    );
  };
}
