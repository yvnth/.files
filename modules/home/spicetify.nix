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
      adblockify
      autoSkipVideo
      fullAlbumDate
      loopyLoop
      simpleBeautifulLyrics
      songStats
      trashbin
      volumePercentage
      wikify
    ];

    enabledSnippets = with spicePkgs.snippets; [
      amogusDancing
      disableRecommendations
      fixDjIcon
      fixedEpisodesIcon
      fixLikedButton
      fixLikedIcon
      fixListenTogetherButton
      fixPlaylistHover
      fixProgressBar
      hideAudiobooksButton
      hidePodcastButton
      jumpingZerotwo
      pointer
      removeDuplicatedFullscreenButton
      removePopular
      removeRecentlyPlayed
      removeTheArtistsAndCreditsSectionsFromTheSidebar
      rightCoverArt
      rotatingCoverart
      roundedButtons
      thickerBars
    ];
  };
}
