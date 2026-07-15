{ config, ... }:
{
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    languagePacks = [
      "en-US"
    ];
    policies = {
      DisableTelemetry = true;
    };
  };
}
