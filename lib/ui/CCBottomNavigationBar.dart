import 'package:cctracker/bloc/Bloc.dart';
import 'package:cctracker/ui/PageViewStateBar.dart';
import 'package:cctracker/ui/PhotoPlatformView.dart';
import 'package:cctracker/ui/PhotosStateBar.dart';
import 'package:cctracker/ui/SettingsStateBar.dart';
import 'package:cctracker/ui/widget/NavDrawer.dart';
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
  String appBarTitle = "Crypto Tracker";
  final String trackerTitle = "Crypto Tracker";
  final String photoTitle = "Photos";
  final String settingsTitle = "Settings";
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();

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
    if (state.index == 3) {
      bloc.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      key: drawerKey,
      drawer: NavDrawer(
          selectedPage: currentIndexBottomBar,
          callbackHome: () => onTabTappedDrawer(0),
          callbackPhoto: () => onTabTappedDrawer(1),
          callbackSettings: () => onTabTappedDrawer(2)),
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
    String tmpTitle = "";

    switch (index) {
      case 0:
        tmpTitle = trackerTitle;
        break;
      case 1:
        tmpTitle = photoTitle;
        break;
      case 2:
        tmpTitle = settingsTitle;
        break;
    }
    setState(() {
      appBarTitle = tmpTitle;
      currentIndexBottomBar = index;
    });
  }

  void onTabTappedDrawer(int index) {
    Navigator.of(context).pop();
    if (index != currentIndexBottomBar) {
      onTabTapped(index);
    }
  }

  // Navigator.of(context).push(MaterialPageRoute(
  //     builder: (BuildContext context) => PhotoPlatformView()));

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
