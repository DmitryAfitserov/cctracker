

import 'dart:io';

import 'package:cctracker/bloc/Bloc.dart';
import 'package:cctracker/models/PhotoData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavDrawer extends Drawer {

  VoidCallback callbackHome;
  VoidCallback callbackPhoto;
  VoidCallback callbackSettings;


  NavDrawer({
    @required VoidCallback callbackHome,
    @required VoidCallback callbackPhoto,
    @required VoidCallback callbackSettings,
  })  :
       // assert(callbackHome != null),
      //  assert(callbackPhoto != null),
      //  assert(callbackSettings != null),
        this.callbackHome = callbackHome,
        this.callbackPhoto = callbackPhoto,
        this.callbackSettings = callbackSettings;

  @override
  Widget build(BuildContext context) {
    bloc.fetchPhoto();

    return  Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Ttem 1"),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("Item 2"),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("Item 2"),
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }


}
