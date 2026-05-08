# NixOS dotfiles ❄️

## Setup

### 1. Bootstrap

A fresh NixOS install won't have `git`, so add it first:

```nix
# /etc/nixos/configuration.nix
environment.systemPackages = with pkgs; [ git ];
```

```bash
sudo nixos-rebuild switch
```

### 2. Clone and Inject Hardware Config

Clone the repo and replace the placeholder hardware config with the one NixOS
generated for your machine during installation:

```bash
git clone https://github.com/yash2k4/nix-dots ~/nix-dots
rm ~/nix-dots/hosts/satella/hardware-configuration.nix
sudo cp /etc/nixos/hardware-configuration.nix ~/nix-dots/hosts/satella/hardware-configuration.nix
sudo chown -R yash2k4:users ~/nix-dots
```

### 3. Copy Age Key

Place your age key so sops-nix can decrypt secrets at build time:

```bash
mkdir -p ~/.config/sops/age
cp /path/to/your/keys.txt ~/.config/sops/age/keys.txt
```

### 4. Build and Switch

```bash
sudo nixos-rebuild switch --flake ~/nix-dots#satella
reboot
```

### 5. Regenerate SSH Public Key

After rebooting, regenerate your SSH public key from your existing private key:

```bash
ssh-keygen -y -f ~/.ssh/id_ed25519 > ~/.ssh/id_ed25519.pub
```

---

<div align="center">
<sub>Built on <a href="https://nixos.org">NixOS</a> · Managed with
<a href="https://github.com/nix-community/home-manager">Home Manager</a> ·
Pinned with <a href="https://nixos.wiki/wiki/Flakes">Flakes</a> ·
Secrets via <a href="https://github.com/Mic92/sops-nix">sops-nix</a></sub>
</div>
