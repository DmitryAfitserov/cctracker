import 'package:cctracker/models/CCData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cctracker/bloc/Bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CCList extends StatefulWidget{

  @override
  State createState() {
    print(Text("createState() ------ ok"));
    return CCListState();
  }
}


  class CCListState extends State<CCList>{

    List<CCData> data = [];

    // @override
    // Widget build(BuildContext context) {
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: Text('Awesome CC Tracker'),
    //     ),
    //     body: Container(
    //       child: ListView(
    //         children: _buildList(),
    //       ),
    //     ),
    //       floatingActionButton: FloatingActionButton(
    //         child: Icon(Icons.refresh),
    //         onPressed: () => _loadCC(),
    //   )
    //   );
    // }

    @override
    Widget build(BuildContext context) {
      bloc.fetch();
      print(Text("main Widget build ------ ok"));
      return Scaffold(

        body: Container(
          child:

          StreamBuilder(
            stream: bloc.allMovies,
            builder: (context, AsyncSnapshot<List<CCData>> snapshot) {
              if (snapshot.hasData) {
              //  if(snapshot.data.isNotEmpty){
                  print(Text("snapshot.hasData ------ ok"));
                  return buildList(snapshot);
              //  }

              } else if (snapshot.hasError) {
                print(Text("snapshot.hasData ------ error -----   " + snapshot.error.toString()));
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            },
          ),


        ),

      );
    }




    Widget buildList(AsyncSnapshot<List<CCData>> snapshot){
      print(Text("buildList start ------ ok + snapshot.data.length =" + snapshot.data.length.toString()));
      return ListView.builder(
          padding: EdgeInsets.all(10.0),
          shrinkWrap: false,
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(context, index, snapshot);
          }
      );
    }


    // List<Widget> _buildList(){
    //
    //   return data.map((CCData f) => ListTile(
    //     subtitle: Text(f.symbol),
    //     title: Text(f.name),
    //     leading: CircleAvatar(child: Text(f.rank.toString())),
    //     trailing: Text('\$${f.price.toStringAsFixed(2)}'),
    //
    //   )).toList();
    //
    // }

      Widget _buildItem(BuildContext context, int index, AsyncSnapshot<List<CCData>> snapshot) {
        print(Text("_buildList ------ ok"));
      data = snapshot.data;
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 0, vertical: 2),

          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(child: Row(
              children: <Widget>[
                  Container(margin: EdgeInsets.all(12), width: 28, child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(data[index].rank.toString(), style: TextStyle(fontSize: 24))
                      ]
                  )
                  ),
                  Container(height: 32,width: 2,color: Colors.blue,alignment: Alignment.centerLeft),
                  Container(margin:EdgeInsets.all(4), padding: EdgeInsets.all(6), child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(data[index].name, style: TextStyle(fontSize: 18)),
                        Text(data[index].symbol)

                      ]

                  )

                  )
                ]

              ),)


,

              Container(margin:EdgeInsets.all(4),  padding: EdgeInsets.all(6), child: Row(

                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[

                    Text(data[index].price.toStringAsFixed(2), style: TextStyle(fontSize: 18)),
                  ]

              )




              )

            ],
          ),
        //  margin: EdgeInsets.all(0),
        );
      }

}




