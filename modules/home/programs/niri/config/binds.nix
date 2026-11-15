{ pkgs, ... }:
let
  inherit (pkgs) lib;

  units = map toString (lib.range 1 9);

  genBindings =
    modifier: attrName:
    lib.genAttrs (map (digit: "${modifier}+${digit}") units) (_: {
      ${attrName} = builtins.fromJSON (builtins.substring (builtins.stringLength _ - 1) 1 _);
    });
in
{
  wayland.windowManager.niri.settings.binds = {
    "Mod+Z".show-hotkey-overlay = { };

    "Mod+T" = {
      _props.hotkey-overlay-title = "Open a Terminal: alacritty";
      spawn = [ "alacritty" ];
    };

    "Mod+D" = {
      _props.hotkey-overlay-title = "Toggle an Application: rofi dmenu";
      spawn-sh = "pgrep -x rofi >/dev/null && pkill -x rofi || rofi -show drun";
    };

    "Mod+P" = {
      _props.hotkey-overlay-title = "Toggle rofi project launcher";
      spawn-sh = "pgrep -x rofi >/dev/null && pkill -x rofi || rofi-project-launcher";
    };

    "Super+Alt+S" = {
      _props = {
        allow-when-locked = true;
        hotkey-overlay-title = null;
      };
      spawn-sh = "pkill orca || exec orca";
    };

    "XF86AudioRaiseVolume" = {
      _props.allow-when-locked = true;
      spawn-sh = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
    };
    "XF86AudioLowerVolume" = {
      _props.allow-when-locked = true;
      spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
    };
    "XF86AudioMute" = {
      _props.allow-when-locked = true;
      spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    };
    "XF86AudioMicMute" = {
      _props.allow-when-locked = true;
      spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
    };

    "XF86AudioPlay" = {
      _props.allow-when-locked = true;
      spawn-sh = "playerctl play-pause";
    };
    "XF86AudioStop" = {
      _props.allow-when-locked = true;
      spawn-sh = "playerctl stop";
    };
    "XF86AudioPrev" = {
      _props.allow-when-locked = true;
      spawn-sh = "playerctl previous";
    };
    "XF86AudioNext" = {
      _props.allow-when-locked = true;
      spawn-sh = "playerctl next";
    };

    "XF86MonBrightnessUp" = {
      _props.allow-when-locked = true;
      spawn = [
        "brightnessctl"
        "--class=backlight"
        "set"
        "+10%"
      ];
    };
    "XF86MonBrightnessDown" = {
      _props.allow-when-locked = true;
      spawn = [
        "brightnessctl"
        "--class=backlight"
        "set"
        "10%-"
      ];
    };

    "Mod+O" = {
      _props.repeat = false;
      toggle-overview = { };
    };
    "Mod+Q" = {
      _props.repeat = false;
      close-window = { };
    };

    "Mod+Left".focus-column-left = { };
    "Mod+H".focus-column-left = { };
    "Mod+Up".focus-window-up = { };
    "Mod+K".focus-window-up = { };
    "Mod+Right".focus-column-right = { };
    "Mod+L".focus-column-right = { };
    "Mod+Down".focus-window-down = { };
    "Mod+J".focus-window-down = { };

    "Mod+Shift+Left".move-column-left = { };
    "Mod+Shift+H".move-column-left = { };
    "Mod+Shift+Up".move-window-up = { };
    "Mod+Shift+K".move-window-up = { };
    "Mod+Shift+Right".move-column-right = { };
    "Mod+Shift+L".move-column-right = { };
    "Mod+Shift+Down".move-window-down = { };
    "Mod+Shift+J".move-window-down = { };

    "Mod+Home".focus-column-first = { };
    "Mod+End".focus-column-last = { };
    "Mod+Ctrl+Home".move-column-to-first = { };
    "Mod+Ctrl+End".move-column-to-last = { };

    "Mod+Ctrl+Left".focus-monitor-left = { };
    "Mod+Ctrl+Down".focus-monitor-down = { };
    "Mod+Ctrl+Up".focus-monitor-up = { };
    "Mod+Ctrl+Right".focus-monitor-right = { };
    "Mod+Ctrl+H".focus-monitor-left = { };
    "Mod+Ctrl+J".focus-monitor-down = { };
    "Mod+Ctrl+K".focus-monitor-up = { };
    "Mod+Ctrl+L".focus-monitor-right = { };

    "Mod+Shift+Ctrl+Left".move-column-to-monitor-left = { };
    "Mod+Shift+Ctrl+Down".move-column-to-monitor-down = { };
    "Mod+Shift+Ctrl+Up".move-column-to-monitor-up = { };
    "Mod+Shift+Ctrl+Right".move-column-to-monitor-right = { };
    "Mod+Shift+Ctrl+H".move-column-to-monitor-left = { };
    "Mod+Shift+Ctrl+J".move-column-to-monitor-down = { };
    "Mod+Shift+Ctrl+K".move-column-to-monitor-up = { };
    "Mod+Shift+Ctrl+L".move-column-to-monitor-right = { };

    "Mod+Page_Down".focus-workspace-down = { };
    "Mod+Page_Up".focus-workspace-up = { };
    "Mod+U".focus-workspace-down = { };
    "Mod+I".focus-workspace-up = { };
    "Mod+Ctrl+Page_Down".move-column-to-workspace-down = { };
    "Mod+Ctrl+Page_Up".move-column-to-workspace-up = { };
    "Mod+Ctrl+U".move-column-to-workspace-down = { };
    "Mod+Ctrl+I".move-column-to-workspace-up = { };

    "Mod+Shift+Page_Down".move-workspace-down = { };
    "Mod+Shift+Page_Up".move-workspace-up = { };
    "Mod+Shift+U".move-workspace-down = { };
    "Mod+Shift+I".move-workspace-up = { };

    "Mod+WheelScrollDown" = {
      _props.cooldown-ms = 150;
      focus-workspace-down = { };
    };
    "Mod+WheelScrollUp" = {
      _props.cooldown-ms = 150;
      focus-workspace-up = { };
    };
    "Mod+Ctrl+WheelScrollDown" = {
      _props.cooldown-ms = 150;
      move-column-to-workspace-down = { };
    };
    "Mod+Ctrl+WheelScrollUp" = {
      _props.cooldown-ms = 150;
      move-column-to-workspace-up = { };
    };

    "Mod+WheelScrollRight".focus-column-right = { };
    "Mod+WheelScrollLeft".focus-column-left = { };
    "Mod+Ctrl+WheelScrollRight".move-column-right = { };
    "Mod+Ctrl+WheelScrollLeft".move-column-left = { };

    "Mod+Shift+WheelScrollDown".focus-column-right = { };
    "Mod+Shift+WheelScrollUp".focus-column-left = { };
    "Mod+Ctrl+Shift+WheelScrollDown".move-column-right = { };
    "Mod+Ctrl+Shift+WheelScrollUp".move-column-left = { };

    "Mod+BraceLeft".consume-or-expel-window-left = { };
    "Mod+BraceRight".consume-or-expel-window-right = { };
    "Mod+Comma".consume-window-into-column = { };
    "Mod+Period".expel-window-from-column = { };

    "Mod+R".switch-preset-column-width = { };
    "Mod+Shift+R".switch-preset-window-height = { };
    "Mod+Ctrl+R".reset-window-height = { };
    "Mod+F".maximize-column = { };
    "Mod+Shift+F".fullscreen-window = { };
    "Mod+M".maximize-window-to-edges = { };
    "Mod+Ctrl+F".expand-column-to-available-width = { };
    "Mod+C".center-column = { };
    "Mod+Ctrl+C".center-visible-columns = { };

    "Mod+Minus".set-column-width = "-10%";
    "Mod+Equal".set-column-width = "+10%";
    "Mod+Shift+Minus".set-window-height = "-10%";
    "Mod+Shift+Equal".set-window-height = "+10%";

    "Mod+V".toggle-window-floating = { };
    "Mod+Shift+V".switch-focus-between-floating-and-tiling = { };
    "Mod+W".toggle-column-tabbed-display = { };

    "Print".screenshot-screen = { };
    "Ctrl+Print".screenshot = { };
    "Alt+Print".screenshot-window = { };

    "Mod+Escape" = {
      _props.allow-inhibiting = false;
      toggle-keyboard-shortcuts-inhibit = { };
    };

    "Mod+Shift+E".quit = { };
    "Ctrl+Alt+Delete".quit = { };
    "Mod+Shift+P".power-off-monitors = { };
  }
  // genBindings "Mod" "focus-workspace"
  // genBindings "Mod+Shift" "move-column-to-workspace";
}
