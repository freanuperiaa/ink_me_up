import 'package:flutter/material.dart';


class HomePage extends StatefulWidget{

  final String user;

  HomePage({this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('INK ME UP'),),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Welcome, ${widget.user}'),
          ],
        ),
      ),
    );
  }
}