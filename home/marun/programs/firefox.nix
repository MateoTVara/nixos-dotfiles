{ config, pkgs, ... }:
let 
  source = path: {
    name = ".${path}";
    value.source = ../dot + "/${path}";
  };
in 
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