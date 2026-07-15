{ lib, ... }:

{
  options.custom.wallpaper = lib.mkOption {
    type = lib.types.str;
    description = "Path to the wallpaper image";
  };
}
