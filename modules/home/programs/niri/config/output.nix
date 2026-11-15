{ ... }:
{
  wayland.windowManager.niri.settings._children = [
    {
      output = {
        _args = [ "Virtual-1" ];

        mode = "1920x1200@59.885";
        scale = 1.0;
        transform = "normal";

        position._props = {
          x = 0;
          y = 0;
        };
      };
    }

    {
      output = {
        _args = [ "HDMI-A-1" ];

        mode = "1920x1080@60.000";
        scale = 1.0;
        transform = "normal";
        position._props = {
          x = 0;
          y = 0;
        };
      };
    }
  ];
}
