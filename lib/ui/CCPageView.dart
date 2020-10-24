
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

  PageController pageController = PageController(
    initialPage: 0
  );

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("CC Tracker"),
        ),
        body: PageView(
            controller: pageController,
            children: [
              CCList(), //LESS 100 $
              CCList(), // FROM $ 100 TO $ 1000
              CCList() //FROM $ 1000


            ],
        ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.refresh),
             // onPressed: () => bloc.fetch()
          )


      );
  }
}