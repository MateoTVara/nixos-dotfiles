{ config, lib, ... }:
let
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;

  cfg = config.sva.programs.zed-editor;
in
{
  options.sva.programs.zed-editor.enable = mkEnableOption "zed-editor";

  imports = [
    ./userSettings.nix
    ./extensions.nix
  ];

  config = mkIf cfg.enable {

    programs.zed-editor = {
      enable = true;
    };
  };
}
