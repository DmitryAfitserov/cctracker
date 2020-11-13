
import 'package:cctracker/ui/widget/ItemPhoto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:flutter_absolute_path/flutter_absolute_path.dart';


class PhotosStateBar extends StatefulWidget {
  @override
  State createState() {
    return PhotosStateBarState();
  }
}

class PhotosStateBarState extends State<PhotosStateBar> {

  static const platformPhoto = const MethodChannel("com.my.flutter/photo");

  @override
  Widget build(BuildContext context) {
   // List<String> litems = ["1", "2", "3", "4"];
    return Scaffold(
        appBar: AppBar(
          title: Text("Photos"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return ItemPhoto(
                      image: "content:\/\/media\/external\/images\/media\/20305",
                        title: "title",
                      callback: () => onPressItem(index),
                    );
                  },
            )),
            ButtonTheme(
              minWidth: 200,
              height: 42.0,
              child: RaisedButton(
                child: Text(
                  "Add photo",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () => onPressAddPhoto(),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                elevation: 5,
                color: Colors.blue,
                textColor: Colors.white,
              ),
            )
          ],
        ));
  }

  void onPressItem(int position) {
    print("On pressed item position $position");
  }

  void onPressAddPhoto() {
    startActivityPhotoInKotlin();
  }


  void startActivityPhotoInKotlin() async{
    String value;
    try {
      value = await platformPhoto.invokeMethod("activity_photo");
    } catch (e) {
      print(e);
    }
    decodeJson(value);
    //   Uri uri = Uri.parse("content:\/\/media\/external\/images\/media\/20305");
// {"title":"Рлл","image":"content:\/\/media\/external\/images\/media\/20305"}

    print(value);

  }

  void decodeJson(String stringJson) async{
    Map<String, dynamic> map =  jsonDecode(stringJson);
    String imageString = map["image"];
    String title = map["title"];

    convertFilePath("g");

    print("tak =====   --- imageString =   $imageString");
    print("tak =====   ---  title =   $title");
  }

  void convertFilePath(String path) async{
    var path = await FlutterAbsolutePath.getAbsolutePath("content://media/external/images/media/27485");
    print("tak =====   ---  title =   $path");
  }

}
