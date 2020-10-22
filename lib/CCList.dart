import 'package:cctracker/CCData.dart';
import 'package:flutter/material.dart';

class CCList extends StatefulWidget{

  @override
  State createState() {
    return CCListState();
  }
}


  class CCListState extends State<CCList>{

    List<CCData> data = [];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Awesome CC Tracker'),
        ),
        body: Container(
          child: ListView(
            children: _buildList(),
          ),
        )
      );
    }

    List<Widget> _buildList(){

      return data.map((CCData f) => ListTile(
        subtitle: Text(f.symbol),
        title: Text(f.name),
        leading: CircleAvatar(child: Text(f.rank.toString())),
        trailing: Text('\$${f.price.toString()}'),

      )).toList();

    }

  }




