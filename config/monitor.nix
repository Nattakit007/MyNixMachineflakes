# config/monitor.nix
{
  "eDP-1" = {
    mode = "1920x1080@144.000";
    # Wrapped in the special props function
    position = _: {
      props = {
        x = 0;
        y = 0;
      };
    };
    # variable-refresh-rate = false;
  };

  "HDMI-A-2" = {
    mode = "1920x1080@144.981";
    # Wrapped in the special props function
    position = _: {
      props = {
        x = 1920;
        y = 0;
      };
    };
  };
}
