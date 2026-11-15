{ config, lib, ... }:
let
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;

  cfg = config.sva.programs.tmux;
in
{
  options.sva.programs.tmux.enable = mkEnableOption "tmux";

  config = mkIf cfg.enable {
    programs.tmux = {
      enable = true;
    };

    xdg.configFile."tmux/tmux.conf".source = ./tmux.conf;
  };
}
