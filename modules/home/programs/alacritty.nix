{ config, lib, ... }:
let
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption;

  cfg = config.sva.programs.alacritty;
in
{
  options.sva.programs.alacritty.enable = mkEnableOption "alacritty";

  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {

        window = {
          padding = {
            x = 0;
            y = 0;
          };
          dynamic_padding = true;
          decorations = "none";
          resize_increments = true;
        };

        font = {
          normal = {
            family = "JetBrainsMono Nerd Font";
          };
          size = 11;
          offset = {
            x = 0;
            y = 0;
          };
          glyph_offset = {
            x = 0;
            y = 0;
          };
          builtin_box_drawing = true;
        };

        colors = {
          primary = {
            foreground = "#C1C7DB";
            background = "#282B34";
          };
        };

        keyboard = {
          bindings = [
            {
              key = "Back";
              mods = "Control";
              chars = "\\u0017";
            }
          ];
        };
      };
    };
  };
}
