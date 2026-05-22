{ config, pkgs, lib, ... }:
let 
  source = path: {
    name = ".${path}";
    value.source = ../dot + "/${path}";
  };
in 
{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.nix-vscode-extensions.vscode-marketplace; [
      jnoortheen.nix-ide
      christian-kohler.path-intellisense
      miguelsolorio.symbols
      wakatime.vscode-wakatime
    ];
  };

  home.file = lib.mkIf (builtins.pathExists ../dot) (
    builtins.listToAttrs (map source [
      "vscode/argv.json"     
    ])
  );
}