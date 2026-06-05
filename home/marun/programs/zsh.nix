{ ... }:

{
  programs.zsh = {
    enable = true;

    history = {
      size = 1000;
      save = 1000;
      path = "$HOME/.histfile";
      # ignoreDups = false;  # Matches default behavior
      # share = false;       # Matches default behavior
    };

    initContent = ''
      # Compinstall save file
      zstyle :compinstall filename "$HOME/.zshrc"

      # Enable LS_COLORS
      eval "$(dircolors -b)"

      # Enable colored completion lists
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"

      # Word navigation
      bindkey '^[[1;5C' forward-word
      bindkey '^[[1;5D' backward-word
      bindkey '^[[3;5~' kill-word

      # History substring search
      autoload -U up-line-or-beginning-search
      autoload -U down-line-or-beginning-search
      zle -N up-line-or-beginning-search
      zle -N down-line-or-beginning-search
      bindkey '^[[A' up-line-or-beginning-search
      bindkey '^[[B' down-line-or-beginning-search
      bindkey "^[OA" up-line-or-beginning-search
      bindkey "^[OB" down-line-or-beginning-search

      # Auto param slash
      setopt AUTO_PARAM_SLASH

      # Reset cursor to beam (bar) after every command
      precmd() { printf '\e[5 q' }
    '';

    defaultKeymap = "emacs";
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  home.shellAliases = {
    ls = "ls --color=auto";
  };
}
