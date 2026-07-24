alias s := switch

switch hostname:
    nixos-rebuild switch --flake .#{{hostname}} --elevate=sudo

up:
    nix flake update

upp input:
    nix flake update {{input}}
