

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
}