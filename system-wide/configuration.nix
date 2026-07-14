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
  imports = [
    ./networkmanager.nix
    ./programs/vim.nix
    ./programs/ssh.nix
  ];

  # Grub bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      device = "nodev";
      efiSupport = true;
    };
  };

  networking = {
    # hostname defined in host-specific dir
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

  # Time zone
  time.timeZone = "America/Lima";
  i18n.defaultLocale = "en_US.UTF-8";

  # Console keyboard layout
  console = {
    font = "Lat2-Terminus16";
    keyMap = "la-latin1";
  };

  # Secrets management with sops-nix
  sops = {
    # age.keyFile = "/home/marun/.config/sops/age/keys.txt";
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    secrets = {
      "users/marun/passwd".neededForUsers = true;
      "wifi/env" = { };
    };
  };

  # Users
  users = {
    mutableUsers = false;
    users = {
      marun = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
        ];
        hashedPasswordFile = config.sops.secrets."users/marun/passwd".path;
        shell = pkgs.zsh;
      };
    };
  };

  # List of programs
  programs = {
    niri.enable = true;
    zsh.enable = true;
    nix-ld.enable = true;
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
    systemPackages = with pkgs; [
      git

      ripgrep

      age
      sops
      ssh-to-age

      nil
      nixd
    ];
  };

  services = {
    displayManager.ly.enable = true;
    printing.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    libinput.enable = true;
    upower.enable = true;
  };

  nix = {
    gc = {
      automatic = true;
      dates = "1:00";
      options = "--delete-older-than 7d";
    };

    optimise = {
      automatic = true;
      dates = "1:15";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "vscode"
    ];

  system.stateVersion = "25.11";
}
