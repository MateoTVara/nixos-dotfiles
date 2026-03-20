# home/marun/git.nix
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "MateoTVara";
        email = "146038574+MateoTVara@users.noreply.github.com";
      };
      init.defaultBranch = "main";
    };
  };
}
