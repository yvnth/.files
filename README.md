# NixOS dotfiles ❄️

## Setup

### 1. Bootstrap

A fresh NixOS install won't have `git`, so enter a nix shell with it:

```bash
nix-shell -p git
```

### 2. Clone and Inject Hardware Config

Clone the repo and replace the placeholder hardware config with the one NixOS
generated for your machine during installation:

```bash
git clone https://github.com/yvnth/dotfiles.git ~/dotfiles
rm ~/dotfiles/hosts/<hostname>/hardware-configuration.nix
sudo cp /etc/nixos/hardware-configuration.nix ~/dotfiles/hosts/<hostname>/hardware-configuration.nix
sudo chown -R yvnth:users ~/dotfiles
```

### 3. Copy Age Key

Place your age key so sops-nix can decrypt secrets at build time:

```bash
mkdir -p ~/.config/sops/age
cp /path/to/your/keys.txt ~/.config/sops/age/keys.txt
chmod 600 ~/.config/sops/age/keys.txt
```

### 4. Restore Secure Boot Keys

Restore your sbctl keys so Lanzaboote can sign boot entries:

```bash
sudo cp -r /path/to/your/sbctl /var/lib/sbctl
sudo chmod 700 /var/lib/sbctl/keys
sudo find /var/lib/sbctl/keys -name "*.key" -exec chmod 600 {} \;
```

### 5. Build and Switch

```bash
nixos-rebuild switch --flake ~/dotfiles#<hostname> --sudo
reboot
```

> After reboot, Lanzaboote will automatically enroll your keys into the firmware.
> Go into UEFI and enable Secure Boot if it isn't already.

### 6. Regenerate SSH Public Key

After rebooting, regenerate your SSH public key from your existing private key:

```bash
ssh-keygen -y -f ~/.ssh/id_ed25519 > ~/.ssh/id_ed25519.pub
```

### 7. Import GPG Key & Restore Password Store

Import the GPG private key into the keyring:

```bash
gpg --import ~/.gnupg/secret-key.asc
```

Then copy your password store:

```bash
cp -r /path/to/your/pass ~/.password-store
```

---

<div align="center">
<sub>Built on <a href="https://nixos.org">NixOS</a> · Managed with
<a href="https://github.com/nix-community/home-manager">Home Manager</a> ·
Pinned with <a href="https://nixos.wiki/wiki/Flakes">Flakes</a> ·
Secrets via <a href="https://github.com/Mic92/sops-nix">sops-nix</a> ·
Secure Boot via <a href="https://github.com/nix-community/lanzaboote">Lanzaboote</a></sub>
</div>
