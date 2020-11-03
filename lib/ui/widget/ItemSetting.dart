

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemSetting extends StatelessWidget {




  VoidCallback onPressed;
  String title;


  ItemSetting({
    @required VoidCallback onPressed,
    @required String title,

    }): assert(onPressed != null),
        assert(title != null),
        this.onPressed = onPressed,
        this.title = title;


  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(0),
      color: Colors.white,
      onPressed: () => onPressed(),
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12)),
        ),
        child: Row(
          //  onTap: () => onTapList(position),
          // title: Text(_listViewData[position], style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),),
          children: [Text(title, style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),),],
        ),

      ),



    );


  }
}