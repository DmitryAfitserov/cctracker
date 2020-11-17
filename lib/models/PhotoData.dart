

class PhotoData {
  String title;
  String path;


  PhotoData(this.title, this.path);

  Map<String, dynamic> toJson(){
    return {
      "title": this.title,
      "path": this.path,

    };
  }

  factory PhotoData.fromJson(Map<String, dynamic> json) {
    return PhotoData(
      json['title'],
      json['path'],
    );
  }
}