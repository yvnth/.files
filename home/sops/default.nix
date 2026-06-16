{
  config,
  ...
}:

{
  sops = {
    age.keyFile = "/home/yvnth/.config/sops/age/keys.txt";

    secrets.ssh_private_key = {
      sopsFile = ../../secrets/satella/yvnth/ssh.yaml;
      key = "private_key";
      path = "${config.home.homeDirectory}/.ssh/id_ed25519";
    };

    secrets.gpg_private_key = {
      sopsFile = ../../secrets/common/gpg.yaml;
      key = "private_key";
      path = "${config.home.homeDirectory}/.gnupg/secret-key.asc";
    };
  };
}
