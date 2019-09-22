import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ink_me_up/src/models/user_profile.dart';


class HomePage extends StatefulWidget{

  final UserProfile user;
  HomePage({this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _databaseReference = Firestore.instance;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('INK ME UP'),),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Welcome, ${widget.user.firstName}'),
          ],
        ),
      ),
    );
  }
}