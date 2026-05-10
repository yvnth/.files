{
  inputs,
  pkgs,
  lib,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.spicetify = {
    enable = true;
    theme = lib.mkForce spicePkgs.themes.catppuccin;
    colorScheme = lib.mkForce "frappe";

    enabledCustomApps = [
      spicePkgs.apps.marketplace
    ];

    enabledExtensions = with spicePkgs.extensions; [
      autoSkipVideo
      loopyLoop
      trashbin
      songStats
      wikify
      adblockify
      fullAppDisplayMod
      fullAlbumDate
      volumePercentage
      simpleBeautifulLyrics
    ];

    enabledSnippets = with spicePkgs.snippets; [
      fixDjIcon
      fixLikedIcon
      fixedEpisodesIcon
      disableRecommendations
      fixPlaylistHover
      fixProgressBar
      rightCoverArt
      pointer
      fixLikedButton
      rotatingCoverart
      removePopular
      amogusDancing
      removeRecentlyPlayed
      hidePodcastButton
      hideAudiobooksButton
      roundedButtons
      roundedThickerBars
      fixListenTogetherButton
      removeDuplicatedFullscreenButton
      removeTheArtistsAndCreditsSectionsFromTheSidebar
      jumpingZerotwo
    ];
  };
}
