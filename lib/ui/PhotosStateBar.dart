import 'package:cctracker/bloc/Bloc.dart';
import 'package:cctracker/models/PhotoData.dart';
import 'package:cctracker/ui/widget/ItemPhoto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




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
    bloc.fetchPhoto();
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
                child:
                StreamBuilder(
                  stream: bloc.dataPhotos,
                  builder: (context, AsyncSnapshot<List<PhotoData>> snapshot) {

                    print(Text("before snapshot.hasData ------ not snapshot.hasData -----   "));

                    if (snapshot.hasData) {

                        print(Text("snapshot.hasData ------ ok"));

                      return  createList(snapshot);

                    } else if (snapshot.hasError) {
                         print(Text("snapshot.hasData ------ error -----   " + snapshot.error.toString()));
                      return Text(snapshot.error.toString());
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                )

            ),
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

  Widget createList(AsyncSnapshot<List<PhotoData>> snapshot){

    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return ItemPhoto(
          image: snapshot.data[index].path,
          title: snapshot.data[index].title,
          callback: () => onPressItem(index),
        );
      },
    );
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
    bloc.addPhoto(value);
   // decodeJson(value);

    //   Uri uri = Uri.parse("content:\/\/media\/external\/images\/media\/20305");
// {"title":"Рлл","image":"content:\/\/media\/external\/images\/media\/20305"}

    print(value);

  }




}
