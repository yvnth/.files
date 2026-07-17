# NixOS dotfiles ❄️

Personal [NixOS](https://nixos.org/) configuration, managed with [home-manager](https://github.com/nix-community/home-manager) and [flakes](https://wiki.nixos.org/wiki/Flakes).

See [BOOTSTRAP.md](./docs/BOOTSTRAP.md) for fresh install instructions.

## Repo layout

```
hosts/            # per-machine configuration
modules/core/     # system-level NixOS modules
modules/home/     # home-manager modules
secrets/          # sops-nix encrypted secrets, per host/user
docs/             # bootstrap and maintenance guides
```

## Stack

- **Window manager:** [mango](https://github.com/mangowm/mango)
- **Theming:** [stylix](https://github.com/nix-community/stylix)
- **Disk layout:** BTRFS encrypted root via [disko](https://github.com/nix-community/disko)
- **Boot:** [Lanzaboote](https://github.com/nix-community/lanzaboote)
- **Secrets:** [sops-nix](https://github.com/Mic92/sops-nix) + [age](https://github.com/FiloSottile/age)

## Adding to this repo

- [Adding a new host](./docs/NEW-HOST.md)
- [Adding a new user](./docs/NEW-USER.md)
- [Adding a core module](./modules/core/README.md)
- [Adding a home module](./modules/home/README.md)
- [Managing secrets](./secrets/README.md)
