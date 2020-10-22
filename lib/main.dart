import 'package:cctracker/CCList.dart';
import 'package:flutter/material.dart';

void main() => runApp(CCTracker());

class CCTracker extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome CC Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: CCList()
    );
  }
}
