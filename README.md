# NixOS Configuration

Personal NixOS system configuration managed in `/etc/nixos`.

## Repository Layout

- `configuration.nix`: Main system configuration entrypoint.
- `hardware-configuration.nix`: Generated hardware-specific configuration.
- `flake.nix`: Flake definition and outputs.
- `users/`: User-level modules and app configuration.
  - `users/marun/default.nix`: User module.
  - `users/marun/git.nix`: Git-related settings.
  - `users/marun/vscode/default.nix`: VS Code module.
  - `users/marun/vscode/argv.json`: VS Code runtime arguments.
- `secrets/secrets.yaml`: Secret material source file.

## Apply Configuration

If using flakes, apply changes with:

```bash
sudo nixos-rebuild switch --flake /etc/nixos#<hostname>
```

Replace `<hostname>` with your host name.

## Notes

- Keep machine-specific settings in `hardware-configuration.nix`.
- Keep sensitive values in `secrets/` and avoid committing plaintext secrets.
