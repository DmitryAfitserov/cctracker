import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:cctracker/ui/widget/ItemSetting.dart';

class SettingsStateBar extends StatefulWidget {
  @override
  State createState() {
    return SettingsStateBarState();
  }
}

class SettingsStateBarState extends State<SettingsStateBar> {

  static const platformSettings = const MethodChannel("com.my.flutter/settings");

  List<String> _listViewData = [
    "О приложении",
    "Помощь",
    "Связаться с нами",
    "Поделиться приложением",
    "Условия пользования",
    "Политика конфиденциальности",
    "Оценить приложение",
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
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: Text(
                        "Настройки",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    Card(
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(12.0),
                        // ),
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
                            ItemSetting(
                              onPressed: () => onTapList(5),
                              title: _listViewData[5],
                            ),
                            ItemSetting(
                              onPressed: () => onTapList(6),
                              title: _listViewData[6],
                            ),
                          ],
                        )),
                    //      )
                  ],
                ),
              ))),
    );
  }

  void onTapList(int position) {
    print(Text("position =  $position "));
    switch (position){
      case 0: {
        print("case 0");
        doInKotlin("aboutApp");
        break;
      }
      case 1: {
        doInKotlin("help");
        break;
      }
      case 2: {
        doInKotlin("feedback");
        break;
      }
      case 3: {
        doInKotlin("shareApp");
        break;
      }
      case 4: {
        doInKotlin("termsOfUse");
        break;
      }
      case 5: {
        doInKotlin("privacyPolicy");
        break;
      }
      case 6: {
        doInKotlin("rateApp");
        break;
      }

    }


  }

  void doInKotlin(String nameMethod) async{

    String value;

    try {
      value = await platformSettings.invokeMethod(nameMethod);
    } catch (e) {
      print(e);
    }

    print(value);
  }

}
