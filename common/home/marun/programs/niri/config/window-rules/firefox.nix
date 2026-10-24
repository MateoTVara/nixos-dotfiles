{ ... }:
{
  wayland.windowManager.niri.settings._children = [
    {
      window-rule._children = [
        {
          match._props = {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          };
          open-floating = true;
        }
      ];
    }

    {
      window-rule._children = [
        {
          match._props = {
            app-id = "firefox$";
          };
          default-column-width.proportion = 1.0;
        }
      ];
    }
  ];
}
