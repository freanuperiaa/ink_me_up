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

  TextStyle drawerHeaderTextStyle = TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.w500);


  Widget getHeaderListTile(String title, IconData icon, VoidCallback callback){
    return ListTile(
      title: Text(title),
      trailing: Icon(icon),
      onTap: callback,
    );
  }


  Widget getAppointmentCard(String name, String desc){
    return Card(
      child: Column(
        children: <Widget>[
          Text(name),
          Text(desc)
        ],
      ),
      elevation: 5.0,
    );
  }

  Widget getArtistCard(String name, String city, VoidCallback ontap){
    return Card(
      child: ListTile(
        leading: Icon(Icons.account_circle),
        trailing: InkWell(
          onTap: ontap,
          child: Icon(Icons.add_box),
        ),
        subtitle: Text(city),
        title: Text(name),
      )
    );
  }
}

var helper = Helper();
