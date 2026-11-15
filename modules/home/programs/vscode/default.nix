{ config, lib, pkgs, ... }:
let
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;

  cfg = config.sva.programs.vscode;
in
{
  options.sva.programs.vscode.enable = mkEnableOption "vscode";

  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      argvSettings = ./argv.json;
      profiles.default = {
        extensions = with pkgs.nix-vscode-extensions.vscode-marketplace; [
          jnoortheen.nix-ide
          christian-kohler.path-intellisense
          miguelsolorio.symbols
          wakatime.vscode-wakatime
          theqtcompany.qt-qml
          kdl-org.kdl
          moocfi.test-my-code
          james-yu.latex-workshop
        ];
      };
    };
  };
}
