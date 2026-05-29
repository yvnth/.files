_default:
    @just --list

rebuild host:
    nixos-rebuild switch --flake .#{{host}} --sudo

upgrade host:
    nix flake update
    nixos-rebuild switch --flake .#{{host}} --sudo

check:
    nix flake check

clean:
    sudo nix-collect-garbage -d
    sudo nix-store --optimize
