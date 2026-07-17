{
  config,
  lib,
  ...
}:
{
  options.homeModules.sops.enable = lib.mkEnableOption "sops";
  config = lib.mkIf config.homeModules.sops.enable {

    sops = {
      age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
      secrets.ssh_private_key = {
        sopsFile = ../../../secrets/satella/yvnth/ssh.yaml;
        key = "private_key";
        path = "${config.home.homeDirectory}/.ssh/id_ed25519";
      };

      secrets.gpg_private_key = {
        sopsFile = ../../../secrets/common/gpg.yaml;
        key = "private_key";
        path = "${config.home.homeDirectory}/.gnupg/secret-key.asc";
      };

      secrets.gpg_owner_trust = {
        sopsFile = ../../../secrets/common/gpg.yaml;
        key = "owner_trust";
        path = "${config.home.homeDirectory}/.gnupg/ownertrust.txt";
      };
    };
  };
}
