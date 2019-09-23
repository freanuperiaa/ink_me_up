import 'package:flutter/material.dart';


class MessagesPage extends StatefulWidget{
  @override
  State createState() => _MessagesPageState();
}


class _MessagesPageState extends State<MessagesPage>{

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: <Widget>[
          Text('Messages'),
        ],
      ),
    );
  }
}
