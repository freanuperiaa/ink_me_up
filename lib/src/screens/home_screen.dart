import 'package:flutter/material.dart';


class HomePageWidget extends StatefulWidget{
  @override
  State createState() => _HomePageWidgetState();
}


class _HomePageWidgetState extends State<HomePageWidget>{

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: <Widget>[
          Text('HOME'),
        ],
      ),
    );
  }
}
