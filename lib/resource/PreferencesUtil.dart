import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:cctracker/models/PhotoData.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtil {
  List<PhotoData> dataPhotos = [];

  final String KEY_PREF = "MY_KEY";


  void addDataInListPhoto() {}

  Future<List<PhotoData>> loadListPhoto() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonList = prefs.getString(KEY_PREF);
    print("==== =---- - -   saveData from pref =   $jsonList ");

    return dataPhotos;
  }

  Future<List<PhotoData>> addPhoto(String jsonString) async {
    PhotoData data = PhotoData("", "");

    decodeJson(jsonString, data);
    // print("decodeJson =====   --- imageString =   " + data.path);
    // print("decodeJson =====   ---  title =   " + data.title);
    data.path = await convertFilePath(data.path);
    print("tak =====   ---  data.path =  " + data.path);
    dataPhotos.add(data);


    return dataPhotos;
  }

   saveData() async {

    String encoded = jsonEncode(dataPhotos);
    print("==== =---- - -   saveData =   $encoded ");

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool test =  await prefs.setString(KEY_PREF, encoded);

    print("==== =---- - -   saveData test =    " + test.toString()) ;

  }

  void decodeJson(String stringJson, PhotoData data) {
    Map<String, dynamic> map = jsonDecode(stringJson);
    data.path = map["image"];
    data.title = map["title"];
  }

  Future<String> convertFilePath(String path) async {
    var pathToFile = await FlutterAbsolutePath.getAbsolutePath(path);
    print("tak =====   ---  title =   $path");
    return pathToFile.toString();
  }

// Future<String> getPath() async{
//   // final filePath = await FlutterAbsolutePath.getAbsolutePath("content://media/external/images/media/27485");
//   Image.file(File("content://media/external/images/media/27485"));
//   return " ";
// }

}
