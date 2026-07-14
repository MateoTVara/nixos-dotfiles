{ pkgs, ... }:
{
  home.packages = with pkgs; [
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
    wakatime-cli
    zip
    unzip
  ];

  imports = [
    ./fastfetch
    ./niri
    ./quickshell
    ./rofi
    ./tmux
    ./vscode
    ./zeditor

    ./alacritty.nix
    ./firefox.nix
    ./git.nix
    ./nvf.nix
    ./ssh.nix
    ./wofi.nix
    ./zsh.nix
  ];
}
