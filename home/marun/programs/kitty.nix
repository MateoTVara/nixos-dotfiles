{ ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono";
      size = 11.25;
    };

    settings = {
      enable_audio_bell = false;

      background_opacity = 0.5;
      background_blur = 1;

      cursor_shape = "beam";
      cursor_blink_interval = 0.5;

      shell_integration = "no-cursor";
    };

    keybindings = {
      "ctrl+backspace" = "send_text all \\x17";
      "ctrl+delete" = "send_text all \\x1b[3;5~";
    };
  };
}
