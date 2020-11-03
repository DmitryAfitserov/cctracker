import 'package:cctracker/ui/PageViewStateBar.dart';
import 'package:cctracker/ui/SettingsStateBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CCBottomNavigationBar extends StatefulWidget {
  @override
  State createState() {
    return CCBottomNavigationBarState();
  }
}

class CCBottomNavigationBarState extends State<CCBottomNavigationBar> {
  int currentIndexBottomBar = 0;
  final List<Widget> childrenStates = [
    PageVIewStateBar(),
    SettingsStateBar(),
  ];

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

// Widget createBodyWithTabBar(){
//   return Column(
//     children:  [
//       Container(
//         //height: 40.0,
//        // color: new Color(0xfff4f5f6),
//
//          child:  TabBar(
//           isScrollable: true,
//           controller: mTabController,
//
//           labelColor: Colors.red,
//           unselectedLabelColor: Color(0xff666666),
//           labelStyle: TextStyle(fontSize: 16.0),
//             tabs: tabList.map((item) {
//               return Tab(
//                 text: item.title,
//               );
//             }).toList()
//
//
//         ),
//
//
//
//       ),
//       Expanded(
//           child: createStreamBuilder()
//       )
//     ],
//   );
//
// }

}
