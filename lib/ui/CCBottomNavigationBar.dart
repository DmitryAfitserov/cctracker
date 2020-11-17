import 'package:cctracker/bloc/Bloc.dart';
import 'package:cctracker/ui/PageViewStateBar.dart';
import 'package:cctracker/ui/PhotosStateBar.dart';
import 'package:cctracker/ui/SettingsStateBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CCBottomNavigationBar extends StatefulWidget {
  @override
  State createState() {
    return CCBottomNavigationBarState();
  }
}

class CCBottomNavigationBarState extends State<CCBottomNavigationBar>
    with WidgetsBindingObserver {
  int currentIndexBottomBar = 0;
  final List<Widget> childrenStates = [
    PageVIewStateBar(),
    PhotosStateBar(),
    SettingsStateBar(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state.index == 2) {
      bloc.dispose();
    }
    print("--------------------- state    " +
        state.toString() +
        " index = " +
        state.index.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childrenStates[currentIndexBottomBar],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Photos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: currentIndexBottomBar,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        onTap: onTabTapped,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndexBottomBar = index;
    });
  }

  @override
  void dispose() {
    print(
        "==== =------------------------------ - - destroy  CCBottomNavigationBar");
    super.dispose();
  }
}
