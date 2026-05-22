# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./programs/vim.nix
    ];
  
  # Use grub
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      device = "nodev";
      efiSupport = true;  
    };
  };

  networking = {
    hostName = "nixos-btw"; # Define your hostname.
    networkmanager.enable = true;
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain"
    # }
    # firewall = {
    #   enable = false;
    #   # Open ports in the firewall.
    #   allowedTCPPorts = [ ... ];
    #   allowedUDPPorts = [ ... ];
    # };
  };

  # Set your time zone.
  time.timeZone = "America/Lima";
  i18n.defaultLocale = "en_US.UTF-8";
  
  # Set the console keyboard layout (used by e.g. virtual consoles)
  console = {
    font = "Lat2-Terminus16";
    keyMap = "la-latin1";
  };

  # Secrets management with sops-nix
  sops = {
    age.keyFile = "/home/marun/.config/sops/age/keys.txt";
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    secrets = {
      marun_passwd.neededForUsers = true;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    mutableUsers = false;
    users = {
      marun = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        hashedPasswordFile = config.sops.secrets.marun_passwd.path;
        shell = pkgs.zsh;
      };
    };
  };

  # List of programs
  programs.niri.enable = true;
  programs.zsh.enable = true;
  programs.ssh = {
    knownHosts = {
      github = {
        hostNames = [ "github.com" ];
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
      };
    };
  };

  # List fonts installed in system profile.
  fonts.packages = with pkgs; [
    noto-fonts

    jetbrains-mono
    nerd-fonts.jetbrains-mono

    maple-mono.truetype
  ];

  environment = {
    # List packages installed in system profile.
    # You can use https://search.nixos.org/ to find more packages (and options).
    systemPackages = with pkgs; [
      git

      ripgrep
      wl-clipboard

      age
      sops
      ssh-to-age
    ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };

  services = {
    displayManager.ly.enable = true;
    openssh.enable = true;
    printing.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    libinput.enable = true;
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "vscode"
  ];
}

