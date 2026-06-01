_default:
    @just --list

rebuild host:
    nh os switch . -H {{host}}

upgrade host:
    nix flake update
    nh os switch . -H {{host}}

check:
    nix flake check

clean:
    nh clean all
    sudo nix-store --optimize
