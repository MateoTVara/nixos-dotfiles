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

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      sops-nix,
      nvf,
      nix-vscode-extensions,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      # List of host directories (subdirectories of ./host-specific)
      hosts = builtins.attrNames (
        # filterAttrs returns a subset of the readDir output
        # where the type is "directory" (i.e. a subdirectory)
        nixpkgs.lib.filterAttrs (name: value: value == "directory")
          # readDir returns a list of { name = "type" }
          # where can be one of the following:
          # "directory", "regular", "symlink", "unknown"
          (builtins.readDir ./host-specific)
      );

      mkHost =
        hostname:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs hostname; };
          modules = [
            sops-nix.nixosModules.sops
            home-manager.nixosModules.default
            ./host-specific/${hostname}
            ./common/system-wide/configuration.nix
            {
              nixpkgs.hostPlatform = system;
              nixpkgs.overlays = [
                nix-vscode-extensions.overlays.default
              ];
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [
                  sops-nix.homeManagerModules.sops
                  nvf.homeManagerModules.default
                ];
                users.marun.imports = [
                  ./common/home/marun
                ];
              };
            }
          ];
        };
    in
    {
      formatter.${system} = pkgs.nixfmt-tree;
      nixosConfigurations =
        # for instance:
        # nixosConfigurations = {
        #   nixos-qvm1 = mkHost "nixos-qvm1";
        #   nixos-qvm2 = mkHost "nixos-qvm2";
        #   nixos-hp-laptop = mkHost "nixos-hp-laptop";
        # };
        nixpkgs.lib.genAttrs hosts mkHost;
    };
}
