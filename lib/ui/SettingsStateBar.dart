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
    List<String> _listViewData = [
      "tab 1",
      "tab 2",
      "tab 3",
      "tab 4",
      "tab 5",
    ];

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
                  Container(
                    height: 360,

                    child: Card(
                      elevation: 3.0,

                      child: ListView.separated(
                        itemCount: 5,
                        padding: EdgeInsets.all(2.0),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_listViewData[index], style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),),
                            onTap: () => onTapList(index),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },

                       // children:
                      //  _listViewData.map((data) => ListTile(title: Text(data))).toList(),

                      ),
                    ),
                  )
                ],
              ),
            )



          )
        ),

    );
  }
  
  void onTapList(int position){
    print(Text("position =  $position "));
  }
}

