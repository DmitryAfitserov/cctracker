import 'package:cctracker/bloc/Bloc.dart';
import 'package:cctracker/models/PhotoData.dart';
import 'package:cctracker/ui/widget/ItemPhoto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';


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
    final TransformationController _controller = TransformationController();
    print("path = " + widget.path);


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body:       Center(
        child: InteractiveViewer(
          //  boundaryMargin: EdgeInsets.all(20.0),
          minScale: 1,
          maxScale: 3,
          transformationController: _controller,
          panEnabled: false,

          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(File( widget.path))
                ,
                //   fit: BoxFit.fill,
              ),
              // shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );


  }
}
