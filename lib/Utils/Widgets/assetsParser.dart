class Assetsparser {
  final String assetPath;
  final String iconName;

  Assetsparser({required this.assetPath, required this.iconName});

  factory Assetsparser.fromSting(String data) {
    String pathImage = "";
    String iconPath = "";
    if (data == "mixing-n-mastering") {
      pathImage = "assets/mixingnMastering.png";
      iconPath = "assets/mixingnMasteringIcon.png";
    }
    if (data == "vocals") {
      pathImage = "assets/vocals.png";
      iconPath = "assets/vocalsIcon.png";
    }
    if (data == "music-production") {
      pathImage = "assets/musicProduction.png";
      iconPath = "assets/musicProductionIcon.png";
    }
    if (data == "lyrics-writing") {
      pathImage = "assets/lyricsWriting.png";
      iconPath = "assets/lyricsWrittingIcon.png";
    }
    

    return Assetsparser(
      assetPath: pathImage,
      iconName: iconPath,
    );
  }
}