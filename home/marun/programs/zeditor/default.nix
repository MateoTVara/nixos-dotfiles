{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./userSettings.nix
    ./extensions.nix
  ];

  programs.zed-editor = {
    enable = true;
  };

  home.activation.zedWakatimeKey = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    key=$(cat ${config.sops.secrets."wakatime_api_key".path})
    settings_file="$HOME/.config/zed/settings.json"
    if [ -f "$settings_file" ]; then
      $DRY_RUN_CMD ${lib.getExe' pkgs.jq "jq"} \
        --arg key "$key" \
        '.lsp.wakatime.initialization_options."api-key" = $key' \
        "$settings_file" > /tmp/zed-settings-tmp.json \
        && mv /tmp/zed-settings-tmp.json "$settings_file"
    fi
  '';
}
