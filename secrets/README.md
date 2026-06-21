# Secrets

Secrets are encrypted with [sops-nix](https://github.com/Mic92/sops-nix) using [age](https://age-encryption.org/).

## Structure

```
secrets/
├── common/          # shared across all hosts
│   └── <name>.yaml
└── <hostname>/      # host or user specific
    └── <username>/
        └── <name>.yaml
```

## Adding a New Secret

1. Create or edit a secrets file:
```bash
sops secrets/<hostname>/<username>/<name>.yaml
```

2. Reference it in the relevant module:
```nix
sops.secrets.<name> = {
  sopsFile = ../../../secrets/<hostname>/<username>/<name>.yaml;
  key = "<key>";
  path = "${config.home.homeDirectory}/path/to/secret";
};
```

## Adding a New Age Key

1. Generate a new age key:
```bash
age-keygen -o ~/.config/sops/age/keys.txt
```

2. Add the public key to `.sops.yaml`:
```yaml
keys:
  - &<hostname>_<username> age1...

creation_rules:
  - path_regex: secrets/.*\.(yaml|json|ini|env|bin)$
    key_groups:
      - age:
          - *<hostname>_<username>
```

3. Re-encrypt all secrets with the new key:
```bash
sops updatekeys secrets/<hostname>/<username>/<name>.yaml
```

## Rotating an Age Key

1. Generate a new age key alongside the old one (keep the old key in place for now):
```bash
age-keygen -o ~/.config/sops/age/keys.txt.new
```

2. Extract the new public key (copy the `public key:` line from the output):
```bash
cat ~/.config/sops/age/keys.txt.new
```

3. Add the new public key to `.sops.yaml` while keeping the old one:
```yaml
keys:
  - &<hostname>_<username>_old age1...  # old key, still needed to decrypt
  - &<hostname>_<username> age1...      # new key

creation_rules:
  - path_regex: secrets/.*\.(yaml|json|ini|env|bin)$
    key_groups:
      - age:
          - *<hostname>_<username>_old
          - *<hostname>_<username>
```

4. Re-encrypt all secrets so they're accessible by both keys:
```bash
sops updatekeys secrets/<hostname>/<username>/<name>.yaml
```

5. Replace the old key file with the new one:
```bash
mv ~/.config/sops/age/keys.txt.new ~/.config/sops/age/keys.txt
chmod 600 ~/.config/sops/age/keys.txt
```

6. Verify decryption still works:
```bash
sops -d secrets/<hostname>/<username>/<name>.yaml
```

7. Remove the old key from `.sops.yaml` and re-encrypt one final time:
```yaml
keys:
  - &<hostname>_<username> age1...  # new key only

creation_rules:
  - path_regex: secrets/.*\.(yaml|json|ini|env|bin)$
    key_groups:
      - age:
          - *<hostname>_<username>
```

```bash
sops updatekeys secrets/<hostname>/<username>/<name>.yaml
```
