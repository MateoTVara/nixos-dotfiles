# Personal Dotfiles for a NixOS System

This repository contains my personal NixOS configuration. Still learning btw.

---

## Notes

- Most of the commit history is AI-generated. That's why the `/this/scripts/mycommit.sh` script exists: it provides additional context to the agent. I'm still not very proficient with these kinds of tools tho.
- The repository is structured as a Nix flake with separate `home/` and `system-wide/` modules.
- Host-specific configurations live under `/host-specific/` (currently: `nixos-hp-laptop`, `nixos-qvm1`, `nixos-qvm2`).
- Secrets are managed with `sops-nix` and live in `/secrets/secrets.yaml`.

---

![Genshiken By SHINPOSTBOY](./this/images/genshiken_By_SHINPOSTBOY.jpg)