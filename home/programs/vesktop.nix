{
  stylix.targets.vesktop.enable = false;
  programs.vesktop.enable = true;

  xdg.configFile."vesktop/settings.json" = {
    text = builtins.toJSON {
      discordBranch = "stable";
      minimizeToTray = true;
      arRPC = true;
      audio = {
        audioGainControl = false;
      };
      splashColor = "rgb(198, 208, 245)";
      splashBackground = "rgb(48, 52, 70)";
    };
    force = true;
  };

  xdg.configFile."vesktop/settings/settings.json" = {
    text = builtins.toJSON {
      themeLinks = [
        "https://raw.githubusercontent.com/catppuccin/discord/main/themes/frappe.theme.css"
      ];
      plugins = {
        AlwaysAnimate = {
          enabled = true;
        };
        AlwaysTrust = {
          enabled = true;
        };
        CallTimer = {
          enabled = true;
        };
        ClearURLs = {
          enabled = true;
        };
        CrashHandler = {
          enabled = true;
        };
        Decor = {
          enabled = true;
        };
        FakeNitro = {
          enabled = true;
        };
        FakeProfileThemes = {
          enabled = true;
        };
        GameActivityToggle = {
          enabled = true;
        };
        OpenInApp = {
          enabled = true;
        };
        ReadAllNotificationsButton = {
          enabled = true;
        };
        ServerInfo = {
          enabled = true;
        };
        ShowHiddenChannels = {
          enabled = true;
        };
        ShowHiddenThings = {
          enabled = true;
        };
        WebKeybinds = {
          enabled = true;
        };
        WebScreenShareFixes = {
          enabled = true;
        };
      };
    };
    force = true;
  };
}
