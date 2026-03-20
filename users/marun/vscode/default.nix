# users/marun/vscode/default.nix
{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    # Extensions for Nix development

    # from nixpkgs
    # profiles.default.extensions = with pkgs.vscode-extensions; [
    #   jnoortheen.nix-ide
    #   # wakatime.vscode-wakatime
    # ];

    # from marketplace
    profiles.default.extensions = with pkgs.vscode-marketplace; [
      jnoortheen.nix-ide
      kdl-org.kdl
      wakatime.vscode-wakatime
    ];

    profiles.default.userSettings = {
      # Nix language server configuration
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil"; # Use nil as the language server

      # Editor settings
      "editor.formatOnSave" = true;
    };
  };

  home.file.".vscode/argv.json".source = ./argv.json;

  # home.file.".vscode/argv.json".text = builtins.toJSON {
  #   "enable-crash-reporter" = true;
  #   "crash-reported-id" = "a1af6f09-f4b5-460f-9dcb-a3f7b50a566c";
  #   "password-store" = "gnome-libsecret";
  # };

  # home.file.".vscode/argv.json".text = ''
  #   {
  #     "enable-crash-reporter": true,
  #     "crash-reporter-id": "a1af6f09-f4b5-460f-9dcb-a3f7b50a566c",
  #     "password-store": "gnome-libsecret"
  #   }
  # '';

}
