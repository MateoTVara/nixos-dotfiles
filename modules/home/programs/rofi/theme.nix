{ config, ... }:
let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi.theme = {
    "*" = {
      cool-light-gray = mkLiteral "#b5bbcf";
      neutral-gray = mkLiteral "#848484";
      muted-lavender-gray = mkLiteral "#847c84";
      dusty-blue = mkLiteral "#7589aa";
      slate-blue = mkLiteral "#617291";
      blue-gray = mkLiteral "#4d5667";
      steel-blue = mkLiteral "#39465a";
      deep-slate = mkLiteral "#2f3749";
      charcoal-navy = mkLiteral "#282b34";
      near-black = mkLiteral "#060708";

      background-color = mkLiteral "transparent";
      text-color = mkLiteral "@cool-light-gray";
    };

    window = {
      width = mkLiteral "30%";
      border = mkLiteral "1px";
      border-color = mkLiteral "@cool-light-gray";
      border-radius = mkLiteral "14px";
      background-color = mkLiteral "@near-black";
    };

    mainbox.children = map mkLiteral [
      "inputbar"
      "message"
      "listview"
    ];

    inputbar = {
      background-color = mkLiteral "@near-black";
      border = mkLiteral "0px 0px 1px 0px";
      border-color = mkLiteral "@cool-light-gray";
      padding = mkLiteral "12px";
      margin = mkLiteral "8px";
      border-radius = mkLiteral "8px 8px 0px 0px";
    };

    prompt = {
      text-color = mkLiteral "@cool-light-gray";
      padding = mkLiteral "0px 8px 0px 0px";
      margin = mkLiteral "0px 8px 0px 0px";
    };

    entry = {
      placeholder = mkLiteral ''" Search | Поиск | Haku | 検索 | Buscar"'';
      text-color = mkLiteral "@cool-light-gray";
    };

    listview = {
      lines = 10;
      dynamic = true;
      border = mkLiteral "1px 0px 0px 0px";
      border-color = mkLiteral "@cool-light-gray";
      padding = mkLiteral "12px 0px 0px 0px";
      margin = mkLiteral "0px 0px 8px 0px";
      scrollbar = false;
    };

    element = {
      padding = mkLiteral "6px";
      margin = mkLiteral "0px 12px 8px 12px";
      border-radius = mkLiteral "12px";
      text-color = mkLiteral "@cool-light-gray";
    };

    "element normal.normal" = {
      background-color = "transparent";
    };

    "element selected.normal" = {
      background-color = mkLiteral "@charcoal-navy";
      text-color = mkLiteral "@cool-light-gray";
    };

    element-icon = {
      size = mkLiteral "32px";
      margin = mkLiteral "0px 12px 0px 6px";
    };

    element-text = {
      text-color = "inherit";
      vertical-align = mkLiteral "0.5";
    };
  };
}
