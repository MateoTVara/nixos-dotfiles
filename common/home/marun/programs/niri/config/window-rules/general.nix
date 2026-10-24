{ ... }:
{
  wayland.windowManager.niri.settings._children = [
    {
      window-rule = {
        match._props.app-id = "^org\\.wezfurlong\\.wezterm$";
        default-column-width = { };
      };
    }

    {
      window-rule = {
        geometry-corner-radius = 4;
        clip-to-geometry = true;
      };
    }
  ];
}
