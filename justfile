_default:
    @just --list

rebuild host:
    sudo nixos-rebuild switch --flake .#{{host}}

upgrade host:
    nix flake update
    sudo nixos-rebuild switch --flake .#{{host}}

check:
    nix flake check

clean:
    sudo nix-collect-garbage -d
    nix-store --optimize
