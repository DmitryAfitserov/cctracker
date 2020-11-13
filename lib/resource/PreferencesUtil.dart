import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:cctracker/models/PhotoData.dart';

class PreferencesUtil{

  List<PhotoData> data = [];

  void addDataInListPhoto(){

  }

  Future<List<PhotoData>> loadListPhoto() async {




    return data;
  }

  Future addPhoto() async {


  }

  Future<String> getPath() async{
    // final filePath = await FlutterAbsolutePath.getAbsolutePath("content://media/external/images/media/27485");
    Image.file(File("content://media/external/images/media/27485"));
    return " ";
  }

  void convertFilePath(String path) async{
    var path = await FlutterAbsolutePath.getAbsolutePath("content://media/external/images/media/27485");
    print("tak =====   ---  title =   $path");
  }




}