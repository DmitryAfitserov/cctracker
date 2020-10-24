import 'package:cctracker/models/CCData.dart';
import 'file:///C:/Users/Dmitry/AndroidStudioProjects/cctracker/lib/ui/CCList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cctracker/bloc/Bloc.dart';

class CCPageView extends StatefulWidget {



  @override
  State createState() {
    return PageViewState();
  }
}

class PageViewState extends State<CCPageView>{

  List<CCData> dataPage1 = [];
  List<CCData> dataPage2 = [];
  List<CCData> dataPage3 = [];

  PageController pageController = PageController(
    initialPage: 0
  );

  @override
  Widget build(BuildContext context) {
      bloc.fetch();

      return Scaffold(
        appBar: AppBar(
          title: Text("CC Tracker"),
        ),
        body:  StreamBuilder(
          stream: bloc.allMovies,
          builder: (context, AsyncSnapshot<List<CCData>> snapshot) {
            if (snapshot.hasData) {
              //  if(snapshot.data.isNotEmpty){
              print(Text("snapshot.hasData ------ ok"));

               return createPageView(snapshot);
              //  }

            } else if (snapshot.hasError) {
              print(Text("snapshot.hasData ------ error -----   " + snapshot.error.toString()));
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),


          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.refresh),
              onPressed: () => bloc.fetch()
          )


      );
  }

  Widget createPageView(AsyncSnapshot<List<CCData>> snapshot) {
    dataPage1.clear();
    dataPage2.clear();
    dataPage3.clear();
    snapshot.data.forEach((element) {
        if(element.price < 100){
          dataPage1.add(element);
        } else if(element.price >= 100 && element.price < 1000){
          dataPage2.add(element);
        } else {
          dataPage3.add(element);
        }
    });

    return PageView(
      controller: pageController,

      children: [
        CCList(dataPage1), //LESS 100 $
        CCList(dataPage2), // FROM $ 100 TO $ 1000
        CCList(dataPage3) //FROM $ 1000


      ],
    );
  }
}