import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cctracker/ui/widget/ItemSetting.dart';



class SettingsStateBar extends StatefulWidget {


  @override
  State createState() {
    return SettingsStateBarState();
  }
}

class SettingsStateBarState extends State<SettingsStateBar>{

  List<String> _listViewData = [
    "tab 1",
    "tab 2",
    "tab 3",
    "tab 4",
    "tab 5",
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text("CC Tracker"),

        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_setting.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(margin: EdgeInsets.fromLTRB(15, 20, 15, 0), child:
                  Text("Settings", style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold), )
                    ,),

                  Card(
                    elevation: 3.0,

                    child: Column(
                      children: [
                        ItemSetting(
                          onPressed: () => onTapList(0),
                          title: _listViewData[0],
                        ),
                        ItemSetting(
                          onPressed: () => onTapList(1),
                          title: _listViewData[1],
                        ),
                        ItemSetting(
                          onPressed: () => onTapList(2),
                          title: _listViewData[2],
                        ),
                        ItemSetting(
                          onPressed: () => onTapList(3),
                          title: _listViewData[3],
                        ),
                        ItemSetting(
                          onPressed: () => onTapList(4),
                          title: _listViewData[4],
                        ),

                      ],
                    )



                  ),
            //      )
                ],
              ),
            )
          )
        ),

    );
  }

  // Widget tabs(int position){
  //   return Container(
  //     child: Row(
  //       //  onTap: () => onTapList(position),
  //       //  title: Text(_listViewData[position], style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),),
  //       children: [Text(_listViewData[position], style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),),],
  //     );,
  //   );
  //
  // }

  void onTapList(int position){
    print(Text("position =  $position "));
  }
}

