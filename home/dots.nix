{ config, ... }:
let
  mkOutOfStoreSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configDir = "${config.home.homeDirectory}/nix-dots/dots";
in
{
  home.file = {
    ".bashrc".source = mkOutOfStoreSymlink "${configDir}/shell/.bashrc";
    ".config/btop".source = mkOutOfStoreSymlink "${configDir}/btop";
    ".config/foot".source = mkOutOfStoreSymlink "${configDir}/foot";
    ".config/helix".source = mkOutOfStoreSymlink "${configDir}/helix";
    ".config/lazydocker".source = mkOutOfStoreSymlink "${configDir}/lazydocker";
    ".config/lazygit".source = mkOutOfStoreSymlink "${configDir}/lazygit";
    ".config/rofi".source = mkOutOfStoreSymlink "${configDir}/rofi";
    ".config/scripts".source = mkOutOfStoreSymlink "${configDir}/scripts";
    ".config/shell".source = mkOutOfStoreSymlink "${configDir}/shell";
    ".config/sway".source = mkOutOfStoreSymlink "${configDir}/sway";
    ".config/swaylock".source = mkOutOfStoreSymlink "${configDir}/swaylock";
    ".config/swaync".source = mkOutOfStoreSymlink "${configDir}/swaync";
    ".config/tmux".source = mkOutOfStoreSymlink "${configDir}/tmux";
    ".config/waybar".source = mkOutOfStoreSymlink "${configDir}/waybar";
    ".config/yazi".source = mkOutOfStoreSymlink "${configDir}/yazi";
    ".config/zathura".source = mkOutOfStoreSymlink "${configDir}/zathura";
    ".zshrc".source = mkOutOfStoreSymlink "${configDir}/shell/.zshrc";
  };
}
