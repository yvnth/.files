{config, ...}: let
  mkOutOfStoreSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configDir = "${config.home.homeDirectory}/nix-dots/dots";
in {
  home.file = {
    ".bashrc".source = mkOutOfStoreSymlink "${configDir}/shell/.bashrc";
    ".config/btop".source = mkOutOfStoreSymlink "${configDir}/btop";
    ".config/cava".source = mkOutOfStoreSymlink "${configDir}/cava";
    ".config/fuzzel".source = mkOutOfStoreSymlink "${configDir}/fuzzel";
    ".config/lazydocker".source = mkOutOfStoreSymlink "${configDir}/lazydocker";
    ".config/lazygit".source = mkOutOfStoreSymlink "${configDir}/lazygit";
    ".config/niri".source = mkOutOfStoreSymlink "${configDir}/niri";
    ".config/noctalia".source = mkOutOfStoreSymlink "${configDir}/noctalia";
    ".config/nvim".source = mkOutOfStoreSymlink "${configDir}/nvim";
    ".config/scripts".source = mkOutOfStoreSymlink "${configDir}/scripts";
    ".config/shell".source = mkOutOfStoreSymlink "${configDir}/shell";
    ".config/starship".source = mkOutOfStoreSymlink "${configDir}/starship";
    ".config/tmux".source = mkOutOfStoreSymlink "${configDir}/tmux";
    ".config/wezterm".source = mkOutOfStoreSymlink "${configDir}/wezterm";
    ".config/yazi".source = mkOutOfStoreSymlink "${configDir}/yazi";
    ".config/zathura".source = mkOutOfStoreSymlink "${configDir}/zathura";
    ".zshrc".source = mkOutOfStoreSymlink "${configDir}/shell/.zshrc";
  };
}
