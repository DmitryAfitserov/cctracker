import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:cctracker/models/PhotoData.dart';
import 'dart:convert';

class PreferencesUtil{

  List<PhotoData> data = [];

  void addDataInListPhoto(){

  }

  Future<List<PhotoData>> loadListPhoto() async {




    return data;
  }

  Future addPhoto(String jsonString) async {
    PhotoData data = PhotoData("", "");
    decodeJson(jsonString, data);
    print("decodeJson =====   --- imageString =   " + data.path);
    print("decodeJson =====   ---  title =   " + data.title);
    convertFilePath(data);


  }

  void decodeJson(String stringJson, PhotoData data) {
    Map<String, dynamic> map =  jsonDecode(stringJson);
    data.path = map["image"];
    data.title = map["title"];
  }





  void convertFilePath(PhotoData data) {
    var path = FlutterAbsolutePath.getAbsolutePath(data.path);
    data.path = path.toString();
    print("tak =====   ---  title =   $path");
  }


  // Future<String> getPath() async{
  //   // final filePath = await FlutterAbsolutePath.getAbsolutePath("content://media/external/images/media/27485");
  //   Image.file(File("content://media/external/images/media/27485"));
  //   return " ";
  // }

}