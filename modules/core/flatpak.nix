{ ... }:

{
  services = {
    flatpak = {
      enable = true;

      remotes = [
        {
          name = "flathub";
          location = "https://flathub.org/repo/flathub.flatpakrepo";
        }
      ];

      update.auto = {
        enable = true;
        onCalendar = "*-*-01 00:00:00";
      };
    };
  };
}
