{
  config,
  ...
}:
{
  sops = {
    age.keyFile = "/home/yvnth/.config/sops/age/keys.txt";

    defaultSopsFile = ../../secrets/secrets.yaml;

    secrets."ssh_keys/satella/yvnth" = {
      path = "${config.home.homeDirectory}/.ssh/id_ed25519";
    };
  };
}
