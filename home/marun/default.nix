{ pkgs, ... }:
let
  enable = name: {
    inherit name;
    value.enable = true;
  };
in
{
  imports = [
    ./programs/zeditor
    ./programs/vscode
    ./programs/fastfetch
    ./programs/quickshell
    ./programs/niri
    ./programs/tmux
    ./programs/rofi
    ./programs/firefox.nix
    ./programs/wofi.nix
    ./programs/alacritty.nix
    ./programs/zsh.nix
    ./programs/git.nix
    ./programs/ssh.nix
    ./programs/nvf.nix
  ];

  sops = {
    age.keyFile = "/home/marun/.config/sops/age/keys.txt";

    defaultSopsFile = ../../secrets/secrets.yaml;

    defaultSopsFormat = "yaml";

    secrets = {
      "wakatime_api_key" = { };
    };
  };

  home = {
    username = "marun";
    homeDirectory = "/home/marun";

    packages = with pkgs; [
      tree
      tokei
      jq
      wl-clipboard
      grim
      slurp
      brightnessctl
      btop
      kdePackages.dolphin
      qbittorrent
      pavucontrol
    ];

    stateVersion = "25.11";
  };

  services =
    (builtins.listToAttrs (
      map enable [
        "polkit-gnome"
        "network-manager-applet"
        "awww"
      ]
    ))
    // { };

  home.file = {
    "Pictures/wallpapers".source = ./Pictures/wallpapers;
    ".local/bin/rofi_project-launcher.sh" = {
      source = ./scripts/rofi_project-launcher.sh;
      executable = true;
    };
  };

  xdg.dataFile = {
    "templates" = {
      source = ./scripts/templates;
      recursive = true;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      name = "adwaita-dark";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.sessionVariables = {
    GDK_DPI_SCALE = "0.9";

    GTK_THEME = "Adwaita:dark";
  };
}
