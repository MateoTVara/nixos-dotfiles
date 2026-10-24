{ ... }:
{
  wayland.windowManager.niri.settings._children = [
    {
      window-rule = {
        match._props.app-id = "dev.zed.Zed";
        default-column-width.proportion = 1.0;
      };
    }
  ];
}
