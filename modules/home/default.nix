{ ... }:
{
  imports = [
    ./core
    ./programs
    ./pictures
  ];

  sva.programs = {
    fastfetch.enable = true;
    niri.enable = true;
    quickshell.enable = true;
    rofi.enable = true;
    tmux.enable = true;
    vscode.enable = true;
    zed-editor.enable = true;
    alacritty.enable = true;
    direnv.enable = true;
    firefox.enable = true;
    git = {
      enable = true;
      user = {
        name = "MateoTVara";
        email = "146038574+MateoTVara@users.noreply.github.com";
      };
    };
    neovim.enable = true;
    ssh.enable = true;
    zsh.enable = true;
  };
}
