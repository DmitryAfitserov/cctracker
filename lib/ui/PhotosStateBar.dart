import 'package:cctracker/ui/widget/ItemPhoto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotosStateBar extends StatefulWidget {
  @override
  State createState() {
    return PhotosStateBarState();
  }
}

class PhotosStateBarState extends State<PhotosStateBar> {
  @override
  Widget build(BuildContext context) {
    List<String> litems = ["1", "2", "3", "4"];
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
                      return ItemPhoto(image: "assets/images/image_temp.jpg", title: "ytyty");
                    })),
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
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                elevation: 5,
                color: Colors.blue,
                textColor: Colors.white,
              ),
            )
          ],
        ));
  }

  void onPressAddPhoto() {
    print("On pressed");
  }
}
