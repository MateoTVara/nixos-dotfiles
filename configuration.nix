# configuration.nix
# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  hardware.graphics.enable = true;

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Select internationalisation properties.
  time.timeZone = "America/Lima";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "la-latin1";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marun = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  programs.niri.enable = true;

  programs.hyprland.enable = true;

  # services.xserver.enable = true;
  services.printing.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.libinput.enable = true; # Enable touchpad support (enabled default in most desktopManager).
  services.openssh.enable = true;
  services.displayManager.ly.enable = true;
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  services.gnome.gnome-keyring.enable = true;

  security.pam.services.ly.enableGnomeKeyring = true;

  # secrets management with sops-nix
  sops.defaultSopsFile = ./secrets/secrets.yaml;
  sops.age.keyFile = "/home/marun/.config/sops/age/keys.txt";

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim
    neovim
    vscode
    wget
    kitty
    wofi
    waybar
    fastfetch
    nil
    nixfmt
    git
    libsecret
    sops
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDIT = "nvim";
    VISUAL = "nvim";
  };

  # environment.variables = {
  #   GNOME_KEYRING_CONTROL = "/run/user/1000/keyring";
  # };

  system.stateVersion = "25.11"; # Don't change this unless you know what you're doing.

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      # Add additional package names here
      "vscode"
      "code"
    ];
}
