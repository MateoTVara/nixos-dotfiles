{ ... }:
{
  wayland.windowManager.niri.settings._children = [
    {
      window-rule = {
        _children = [
          {
            match._props = {
              app-id = "zoom";
              title = "zoom";
            };
          }
          {
            match._props = {
              app-id = "zoom";
              title = "annotate_toolbar";
            };
          }
        ];
        open-floating = true;
      };
    }
  ];
}
