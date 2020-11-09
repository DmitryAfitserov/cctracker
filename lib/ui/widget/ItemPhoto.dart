import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemPhoto extends StatelessWidget {
  String image;
  String title;


  ItemPhoto({
    @required String image,
    @required String title,
  })  : assert(image != null),
        assert(title != null),
        this.image = image,
        this.title = title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Row(

        children: [
          Container(
            margin: EdgeInsets.all(8),
            height: 110.0,
            width: 152.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    image),
                fit: BoxFit.fitHeight,
              ),
              // shape: BoxShape.circle,
            ),
          ),
          Text(title, style: TextStyle(fontSize: 16),),

        ],

      ),

    );







    //   RaisedButton(
    //   padding: EdgeInsets.all(0),
    //   color: Colors.white,
    // //  onPressed: () => onPressed(),
    //   child: Container(
    //     padding: EdgeInsets.all(14),
    //     decoration: BoxDecoration(
    //       border: Border(bottom: BorderSide(color: Colors.black12)),
    //     ),
    //     child: Row(
    //       children: [
    //         Text(
    //           title,
    //           style: TextStyle(
    //               color: Colors.indigo,
    //               fontSize: 18,
    //               fontWeight: FontWeight.bold),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
