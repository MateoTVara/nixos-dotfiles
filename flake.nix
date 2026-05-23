{
  description = "NixOs configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    sops-nix,

    nvf,
    nix-vscode-extensions,
    ...
  }:
  let 
    system = "x86_64-linux";
  in 
  {
    nixosConfigurations = {
      "nixos-qvm1" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          sops-nix.nixosModules.sops

          ./host-specific/nixos-qvm1
          ./system-wide/configuration.nix

          {
            nixpkgs.overlays = [
              nix-vscode-extensions.overlays.default
            ];
          }
          
          home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupCommand =
                "bash -c 'tar --zstd -cf \"$1.$(date +%s).tar.zst\" \"$1\" && rm -rf \"$1\"' --";
              sharedModules = [
                sops-nix.homeManagerModules.sops
                nvf.homeManagerModules.default
              ];
              users = {
                marun.imports = [
                  ./home/users/marun/nixos-qvm1.nix
                  ./home/users/marun
                ];
              };
            };
          }
        ];
      };
      "nixos-qvm2" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          sops-nix.nixosModules.sops

          ./host-specific/nixos-qvm2
          ./system-wide/configuration.nix

          {
            nixpkgs.overlays = [
              nix-vscode-extensions.overlays.default
            ];
          }
          
          home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupCommand =
                "bash -c 'tar --zstd -cf \"$1.$(date +%s).tar.zst\" \"$1\" && rm -rf \"$1\"' --";
              sharedModules = [
                sops-nix.homeManagerModules.sops
                nvf.homeManagerModules.default
              ];
              users = {
                marun.imports = [
                  ./home/users/marun
                  ./home/users/marun/nixos-qvm2.nix
                ];
              };
            };
          }
        ];
      };
    };
  };
}
