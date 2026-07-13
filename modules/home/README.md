# Home Modules

Each module lives in its own directory under `modules/home/`.

## Adding a New Module

1. Create `modules/home/<name>/default.nix`:
```nix
{ lib, config, pkgs, ... }:
{
  options.homeModules.<name>.enable = lib.mkEnableOption "<name>";

  config = lib.mkIf config.homeModules.<name>.enable {
    home.packages = with pkgs; [
      <name>
    ];

    home.file.".config/<name>".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.files/modules/home/<name>/config";
  };
}
```

2. Add to `modules/home/default.nix`:
```nix
imports = [
  # ...existing...
  ./<name>
];
```

3. Enable in `hosts/<hostname>/home.nix`:
```nix
homeModules.<name>.enable = true;
```
