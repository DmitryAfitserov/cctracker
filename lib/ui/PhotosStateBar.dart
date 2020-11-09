

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotosStateBar extends StatefulWidget{


  @override
  State createState() {
      return PhotosStateBarState();
  }
}

class PhotosStateBarState extends State<PhotosStateBar>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
      ),
      body: Container(

      ),

      
    );
  }
}