hostname := `hostname -s`

_default:
    @just --list

rebuild host=hostname:
    nh os switch . -H {{ host }}

upgrade host=hostname:
    nix flake update
    nh os switch . -H {{ host }}

check:
    nix flake check

clean:
    nh clean all
    sudo nix-store --optimize
