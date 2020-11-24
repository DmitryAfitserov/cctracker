import 'dart:io';

import 'package:cctracker/bloc/Bloc.dart';
import 'package:cctracker/models/PhotoData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void IntCallback(int index);

class NavDrawer extends Drawer {
  final IntCallback callback;
  int selectedPage;

  // VoidCallback callbackHome;
  // VoidCallback callbackPhoto;
  // VoidCallback callbackSettings;

  // NavDrawer({
  //   @required int selectedPage,
  //   @required VoidCallback callbackHome,
  //   @required VoidCallback callbackPhoto,
  //   @required VoidCallback callbackSettings,
  //   @required Function(int) callback(int),
  //
  // }
  //
  // )  : assert(selectedPage != null),
  //       assert(callbackHome != null),
  //       assert(callbackPhoto != null),
  //       assert(callbackSettings != null),
  //       assert(callback != null),
  //       this.selectedPage = selectedPage,
  //       this.callbackHome = callbackHome,
  //       this.callbackPhoto = callbackPhoto,
  //
  //       this.callbackSettings = callbackSettings,
  //       this.callback;

  NavDrawer(this.callback, this.selectedPage);

  @override
  Widget build(BuildContext context) {

    List<bool> selected = [false, false, false];
    selected[selectedPage] = true;

    return Drawer(

      child: Column(

          children: [
        Container(
            margin: EdgeInsets.fromLTRB(0, 24, 0, 24),
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_setting.jpg'),
              fit: BoxFit.fill,
            ),
             shape: BoxShape.circle,
          ),
        ),
        Divider(
          color: Colors.blueGrey,

          height: 0,
        ),
        ListTile(
          title: Text("Item 1"),
          leading: Icon(Icons.home),
          trailing: Icon(Icons.arrow_forward),
          onTap: () => callback(0),
          selected: selected[0],

          //   se
        ),
        new Divider(
          color: Colors.blueGrey,
          height: 0,
        ),
        ListTile(
          title: Text("Item 2"),
          leading: Icon(Icons.photo),
          trailing: Icon(Icons.arrow_forward),
          onTap: () => callback(1),
          selected: selected[1],
        ),
        new Divider(
          color: Colors.blueGrey,
          height: 0,
        ),
        ListTile(
          title: Text("Item 3"),
          leading: Icon(Icons.settings),
          trailing: Icon(Icons.arrow_forward),
          onTap: () => callback(2),
          selected: selected[2],
        ),
        new Divider(
          color: Colors.blueGrey,
          height: 0,
        )
      ],

      ),
    );
  }
}
