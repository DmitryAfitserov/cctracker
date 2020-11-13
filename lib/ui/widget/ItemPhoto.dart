

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPhoto extends StatelessWidget {
  String image;
  String title;
  VoidCallback callback;


  ItemPhoto({
    @required String image,
    @required String title,
    @required VoidCallback callback,
  })  : assert(image != null),
        assert(title != null),
        assert(callback != null),
        this.image = image,
        this.title = title,
        this.callback = callback;

  @override
  Widget build(BuildContext context) {
  //  final filePath = await FlutterAbsolutePath.getAbsolutePath("content://media/external/images/media/27485");
    return RaisedButton(
      onPressed: callback,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
      child: Card(
        elevation: 4,
        child: Row(

          children: [
            Container(
              margin: EdgeInsets.all(8),
              height: 110.0,
              width: 152.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File("/data/user/0/com.my.cctracker/cache/IMG_1605283053887.png"))

                  //  AssetImage(
                  //      "content://media/external/images/media/27485"
                  //  )
                  ,
                  fit: BoxFit.fitHeight,
                ),
                // shape: BoxShape.circle,
              ),
            ),
            Text(title, style: TextStyle(fontSize: 16),),

          ],

        ),

      ),

    );

  }

  Future<String> getPath() async{
   // final filePath = await FlutterAbsolutePath.getAbsolutePath("content://media/external/images/media/27485");
    Image.file(File("content://media/external/images/media/27485"));
    return " ";
  }

}
