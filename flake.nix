{
  description = "Framework-agnostic guidance for writing unit tests, with bindings per test framework";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "aarch64-darwin"
        "x86_64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      packages = forAllSystems (pkgs: {
        default = pkgs.stdenvNoCC.mkDerivation {
          pname = "unit-test-guidance";
          version = "0.1.0";
          src = nixpkgs.lib.fileset.toSource {
            root = ./.;
            fileset = nixpkgs.lib.fileset.fileFilter (file: file.hasExt "md") ./.;
          };
          dontBuild = true;
          installPhase = ''
            runHook preInstall
            mkdir -p $out/share/unit-test-guidance
            cp -r . $out/share/unit-test-guidance
            runHook postInstall
          '';
        };
      });
    };
}
