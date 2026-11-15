{ config, lib, ... }:
let
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;

  cfg = config.sva.programs.quickshell;
in
{
  options.sva.programs.quickshell.enable = mkEnableOption "quickshell";

  config = mkIf cfg.enable {
    programs.quickshell = {
      enable = true;

      systemd.enable = true;

      configs = {
        default = ./config;
      };

      activeConfig = "default";
    };
  };
}
