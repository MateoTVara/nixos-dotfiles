{ pkgs, ... }:
{
  imports = [
    ./ssh.nix
    ./vim.nix
  ];

  # List of programs
  programs = {
    niri.enable = true;
    zsh.enable = true;
    nix-ld.enable = true;
  };

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
}
