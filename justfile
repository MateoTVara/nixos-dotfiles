build-switch hostname:
    nixos-rebuild switch --flake .#{{hostname}} --use-remote-sudo

up:
    nix flake update

upp input:
    nix flake update {{input}}
