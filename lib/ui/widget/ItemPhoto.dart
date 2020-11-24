import 'dart:io';

import 'package:cctracker/bloc/Bloc.dart';
import 'package:cctracker/models/PhotoData.dart';
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
    bloc.fetchPhoto();

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
                  image: FileImage(File(image)),
                  fit: BoxFit.fill,
                ),
                // shape: BoxShape.circle,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
