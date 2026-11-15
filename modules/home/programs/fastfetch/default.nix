{ config, lib, ... }:
let
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;

  cfg = config.sva.programs.fastfetch;
in
{
  options.sva.programs.fastfetch.enable = mkEnableOption "fastfetch";

  config = mkIf cfg.enable {
    programs.fastfetch = {
      enable = true;
      settings = builtins.fromJSON (builtins.readFile ./config.json);
    };
  };
}
