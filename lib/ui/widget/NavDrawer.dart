import 'dart:io';

import 'package:cctracker/bloc/Bloc.dart';
import 'package:cctracker/models/PhotoData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavDrawer extends Drawer {
  final void Function(int) callback;
  int selectedPage;
  VoidCallback callbackHome;
  VoidCallback callbackPhoto;
  VoidCallback callbackSettings;

  NavDrawer({
    @required int selectedPage,
    @required VoidCallback callbackHome,
    @required VoidCallback callbackPhoto,
    @required VoidCallback callbackSettings,
    @required Function(int) callback,

  })  : assert(selectedPage != null),
        assert(callbackHome != null),
        assert(callbackPhoto != null),
        assert(callbackSettings != null),
        assert(callback != null),
        this.selectedPage = selectedPage,
        this.callbackHome = callbackHome,
        this.callbackPhoto = callbackPhoto,
        this.callback = callback,
        this.callbackSettings = callbackSettings;

  @override
  Widget build(BuildContext context) {
    bloc.fetchPhoto();

    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Item 1"),
            trailing: Icon(Icons.arrow_forward),
            onTap: callback(0),
          ),
          ListTile(
            title: Text("Item 2"),
            trailing: Icon(Icons.arrow_forward),
            onTap: callbackPhoto,
          ),
          ListTile(
            title: Text("Item 3"),
            trailing: Icon(Icons.arrow_forward),
            onTap: callbackSettings,
          ),
        ],
      ),
    );
  }
}
