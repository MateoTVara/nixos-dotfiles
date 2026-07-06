{ ... }:

{
  imports = [
    ./userSettings.nix
    ./extensions.nix
  ];

  programs.zed-editor = {
    enable = true;
  };
}
