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
    ./programs/fastfetch
    ./programs/quickshell
    ./programs/niri
    ./programs/tmux
    ./programs/firefox.nix
    ./programs/wofi.nix
    ./programs/alacritty.nix
    ./programs/zsh.nix
    ./programs/git.nix
    ./programs/ssh.nix
    ./programs/nvf.nix

    ./services/awww.nix
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
      zed-editor
      qbittorrent
      pavucontrol
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
        "network-manager-applet"
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

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
  };

  home.sessionVariables = {
    # XDG_CURRENT_DESKTOP "Niri"
    # XDG_SESSION_TYPE "wayland"
    # XDG_SESSION_DESKTOP "Niri"

    # QT_QPA_PLATFORMTHEME "qt6ct"
    # QT_SCALE_FACTOR "1"
    # QT_QPA_PLATFORM "wayland"

    # GDK_SCALE "1"
    # GDK_DPI_SCALE "0.9"
    GDK_DPI_SCALE = "0.9";

    # GTK_THEME "Adwaita:dark"
    GTK_THEME = "Adwaita:dark";
  };
}
