{ ... }:

{
  programs.wofi = {
    enable = true;

    settings = {
      show = "drun";

      width = "30%";
      height = "50%";
      location = "center";
      prompt = "Search | Поиск | Haku | 検索 | Buscar";
      allow_markup = true;
      insensitive = true;
      allow_images = true;
      image_size = 24;
      gtk_dark = true;
      hide_scroll = true;
      no_actions = true;
      term = "kitty";

      # Defaults but re defined for clarity
      orientation = "vertical";
      halign = "fill";
      content_halign = "fill";
      filter_ratio = 100;
    };

    style = ''
      @define-color cool-light-gray      #b5bbcf;
      @define-color neutral-gray         #848484;
      @define-color muted-lavender-gray  #847c84;
      @define-color dusty-blue           #7589aa;
      @define-color slate-blue           #617291;
      @define-color blue-gray            #4d5667;
      @define-color steel-blue           #39465a;
      @define-color deep-slate           #2f3749;
      @define-color charcoal-navy        #282b34;
      @define-color near-black           #060708;

      * {
        font-family: Maple Mono;
        background: transparent;
        color: @cool-light-gray;
      }

      #window {
        color: @cool-light-gray;
        border-color: @cool-light-gray;
        border-style: solid;
        border-width: 1px;

        /* Gradient workaround for cleaner border radius */
        background-image: linear-gradient(to bottom, @near-black 100%);
        border-radius: 14px;
      }

      #input {
        background-color: @near-black;
        color: @cool-light-gray;
        border-color: @cool-light-gray;

        border-style: none;
        border-bottom-style: solid;
        border-width: 1px;

        font-style: normal;

        border-radius: 8px;
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px;

        padding: 12px;
        margin: 8px;
      }

      #input:focus {
        background: @charcoal-navy;
        background-color: @charcoal-navy;
        border-color: @dusty-blue;
        font-style: italic;
      }

      #scroll {
        border-top-style: solid;
        border-width: 1px;
        border-color: @cool-light-gray;
        margin-bottom: 8px;
      }

      #inner-box {
        padding-top: 12px;
      }

      #entry {
        border-style: none;
        border-color: @cool-light-gray;
        color: @cool-light-gray;
        padding: 6px;
        margin-bottom: 8px;
        margin-left: 12px;
        margin-right: 12px;

        border-radius: 12px;
      }

      #entry:selected {
        background: @charcoal-navy;
        color: @cool-light-gray;
        font-weight: bold;
        outline: none;
      }

      #img {
        padding: 4px;
        margin-right: 6px;
      }
    '';
  };
}
