{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.vscode = {
    enable = true;
    argvSettings = ./argv.json;
    profiles.default = {
      extensions = with pkgs.nix-vscode-extensions.vscode-marketplace; [
        jnoortheen.nix-ide
        christian-kohler.path-intellisense
        miguelsolorio.symbols
        wakatime.vscode-wakatime
      ];
    };
  };
}
