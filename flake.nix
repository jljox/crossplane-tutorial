{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.default = pkgs.mkShell {
        nativeBuildInputs = [
          pkgs.gum
          pkgs.gh
          pkgs.kind
          pkgs.kubectl
          pkgs.yq-go
          pkgs.jq
          pkgs.awscli2
          pkgs.upbound
          pkgs.teller
          pkgs.crossplane-cli
          pkgs.kubernetes-helm
        ];
      };
    });
}
