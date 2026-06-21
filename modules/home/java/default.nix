{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.homeModules.java.enable = lib.mkEnableOption "java";

  config = lib.mkIf config.homeModules.java.enable {
    home.packages = with pkgs; [
      gradle
      jetbrains.idea-oss
      jdk21
      maven
    ];

    home.sessionVariables.JAVA_HOME = "${pkgs.jdk21}";

    home.file.".jdks/jdk8".source = "${pkgs.jdk8}/lib/openjdk";
    home.file.".jdks/jdk11".source = "${pkgs.jdk11}/lib/openjdk";
    home.file.".jdks/jdk17".source = "${pkgs.jdk17}/lib/openjdk";
    home.file.".jdks/jdk21".source = "${pkgs.jdk21}/lib/openjdk";
    home.file.".jdks/jdk25".source = "${pkgs.jdk25}/lib/openjdk";
  };
}
