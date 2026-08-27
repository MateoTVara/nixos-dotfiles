alias s := switch

switch hostname:
    nixos-rebuild switch --flake .#{{ hostname }} --elevate=sudo

up hostname:
    nix flake update
    just switch {{ hostname }}
    git add flake.lock
    git diff --cached --quiet || git commit -m "flake.lock update"
    git push

upp input hostname:
    nix flake update {{ input }}
    just switch {{ hostname }}
    git add flake.lock
    git diff --cached --quiet || git commit -m "flake.lock update"
    git push
