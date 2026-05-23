{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    signing = {
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
    settings = {
      user = {
        name = "MateoTVara";
        email = "146038574+MateoTVara@users.noreply.github.com";
      };

      init = {
        defaultBranch = "main";
      };

      editor = {
        default = "nvim";
      };

      gpg = {
        format = "ssh";
      };
    };
  };
}
