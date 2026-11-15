{ config, lib, ... }:
let
  inherit (lib) types;
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkOption mkEnableOption;

  cfg = config.sva.programs.git;
in
{
  options.sva.programs.git = {
    enable = mkEnableOption "git";
    user = {
      name = mkOption {
        type = types.str;
      };
      email = mkOption {
        type = types.str;
      };
    };
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      signing = {
        key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
        signByDefault = true;
      };
      settings = {
        user = {
          name = cfg.user.name; 
          email = cfg.user.email;
        };

        init.defaultBranch = "main";
        editor.default = "nvim";
        gpg.format = "ssh";
      };
    };
  };
}
