import 'package:flutter/material.dart';


class Helper{

  var themePrimaryColor = Colors.indigo;
  var themeAccentColor = Colors.blue;

  var emptyContainer = Container(height: 0.0, width: 0.0,);
  var EDGEINSETS_LTRB_30T = EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0);
  var EDGEINSETS_LTRB_100T = EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0);
  var EDGEINSETS_LTRB_15T = EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0);
  var EDGEINSETS_LTRB_45T = EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0);
  var EDGEINSETS_ALL_16 = EdgeInsets.all(16.0);


  var authButton1Style = TextStyle(fontSize: 20.0, color: Colors.white);
  var authButton2Style = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300);
  var authErrorStyle =  TextStyle(fontSize: 13.0, color: Colors.red, height: 1.0, fontWeight: FontWeight.w300);


  Widget getHeaderListTile(String title, IconData icon, VoidCallback callback){
    return ListTile(
      title: Text(title),
      trailing: Icon(icon),
      onTap: callback,
    );
  }


}

var helper = Helper();
