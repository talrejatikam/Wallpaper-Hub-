class WallpaperModel{
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  SrcModel src;
WallpaperModel({this.photographer,this.photographerId,this.photographerUrl,this.src,this.url});

factory WallpaperModel.fromMap(Map<String,dynamic> jsonData){
  return WallpaperModel(
      src: SrcModel.fromMap(jsonData["src"]),
    photographer: jsonData["photographer"],
    photographerId: jsonData["photographerId"],
    photographerUrl: jsonData["photographerUrl"],
    url: jsonData["url"]
  );
}
}
class SrcModel{
  String portrait;
  String large;
  String landscape;
  String medium;
  SrcModel({this.landscape,this.large,this.medium,this.portrait});

  factory SrcModel.fromMap(Map<String,dynamic> jsonData){
    return SrcModel(
      portrait: jsonData["portrait"],
      landscape: jsonData["landscape"],
      large: jsonData["large"],
      medium: jsonData["medium"]
    );
  }
}