import 'package:cctracker/bloc/Bloc.dart';
import 'package:cctracker/models/PhotoData.dart';
import 'package:cctracker/ui/widget/ItemPhoto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhotosInteractiveViewer extends StatefulWidget {

  String path = "";

  PhotosInteractiveViewer(this.path);


  @override
  State createState() {
    return PhotosInteractiveViewerState();
  }
}

class PhotosInteractiveViewerState extends State<PhotosInteractiveViewer> {


  @override
  Widget build(BuildContext context) {

    print("path = " + widget.path);

    return Scaffold(
      body: Text("df"),
    );
  }
}
