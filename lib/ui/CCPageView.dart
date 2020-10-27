import 'package:cctracker/models/CCData.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cctracker/bloc/Bloc.dart';
import 'package:cctracker/ui/CCList.dart';

class CCPageVIew extends StatefulWidget{


  @override
  State createState() {
    return CCPageViewState();
  }
}

class CCPageViewState extends State<CCPageVIew> with SingleTickerProviderStateMixin{


  List<CCData> dataPage1 = [];
  List<CCData> dataPage2 = [];
  List<CCData> dataPage3 = [];

  TabController mTabController;
  PageController mPageController = PageController(initialPage: 0);
  List<String> tabList;
  var isPageCanChanged = true;

  @override
  void initState() {
    super.initState();
    initTabData();
    mTabController = TabController(
      length: tabList.length,
      vsync: this,
    );
    mTabController.addListener(() {//TabBar listener
      if (mTabController.indexIsChanging) { // determine whether TabBar switches
        print(mTabController.index);
        onPageChange(mTabController.index, p: mPageController);
      }
    });

  }

  initTabData() {
    tabList = [
      '0-10\$',
      '10-100\$',
      'more 100\$',
    ];
  }

  onPageChange(int index, {PageController p, TabController t}) async {
    if (p != null) {//determine which switch is
      isPageCanChanged = false;
      await mPageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);//Wait for pageview to switch, then release pageivew listener
      isPageCanChanged = true;
    } else {
      mTabController.animateTo(index); //Switch Tabbar
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CC Tracker"),
          bottom: TabBar(

            //  isScrollable: true,
              controller: mTabController,

              tabs: tabList.map((item) {
                return Tab(
                  text: item,
                );
              }).toList()


          ),
        ),
        body:  createStreamBuilder(),
        //  _children[currentIndex],


        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () => bloc.fetch()
        )


    );
  }

  Widget createStreamBuilder(){
    return StreamBuilder(
      stream: bloc.allMovies,
      builder: (context, AsyncSnapshot<List<CCData>> snapshot) {
        if (snapshot.hasData) {

          print(Text("snapshot.hasData ------ ok"));

          return createPageView(snapshot);
          
        } else if (snapshot.hasError) {
          print(Text("snapshot.hasData ------ error -----   " + snapshot.error.toString()));
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget createPageView(AsyncSnapshot<List<CCData>> snapshot) {
    print(Text("createPageView ------ ok"));
    // Widget createPageView() {
    dataPage1.clear();
    dataPage2.clear();
    dataPage3.clear();
    snapshot.data.forEach((element) {
      if(element.price < 10){
        dataPage1.add(element);
      } else if(element.price >= 10 && element.price < 100){
        dataPage2.add(element);
      } else {
        dataPage3.add(element);
      }
    });

    return PageView(
      // controller: pageController,
      controller: mPageController,
      onPageChanged: (index) {
        if (isPageCanChanged) { // because the pageview switch will call back this method, it will trigger the switch tabbar operation, so define a flag, control pageview callback
          onPageChange(index);
        }
      },
      children: [
        CCList(dataPage1), //LESS 10 $
        CCList(dataPage2), // FROM $ 10 TO $ 100
        CCList(dataPage3) //FROM $ 100
      ],
    );

    // return PageView.builder(
    //   itemCount: tabList.length,
    //   onPageChanged: (index) {
    //     if (isPageCanChanged) { // because the pageview switch will call back this method, it will trigger the switch tabbar operation, so define a flag, control pageview callback
    //       onPageChange(index);
    //     }
    //   },
    //   controller: mPageController,
    //   itemBuilder: (BuildContext context, int index) {
    //
    //     return  ;
    //     //   children: [
    //     // CCList(dataPage1), //LESS 10 $
    //     // CCList(dataPage2), // FROM $ 10 TO $ 100
    //     // CCList(dataPage3) //FROM $ 100
    //     // ];
    //   },
    // );


  }

}