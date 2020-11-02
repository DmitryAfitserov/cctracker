import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class SettingsStateBar extends StatefulWidget {


  @override
  State createState() {
    return SettingsStateBarState();
  }
}

class SettingsStateBarState extends State<SettingsStateBar>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CC Tracker"),

        ),
        body: Text("Settings")
    );
  }
}

