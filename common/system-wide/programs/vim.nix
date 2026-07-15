{ pkgs, ... }:
{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    package = (pkgs.vim-full.override { }).customize {
      name = "vim";
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [
          vim-nix
          vim-lastplace
        ];
        opt = [ ];
      };

      vimrcConfig.customRC = ''
        set nocompatible

        filetype plugin on
        syntax on

        set number
        set smartindent
        set expandtab
        set tabstop=2
        set shiftwidth=2
        set softtabstop=2
        set backspace=indent,eol,start
      '';
    };
  };
}
