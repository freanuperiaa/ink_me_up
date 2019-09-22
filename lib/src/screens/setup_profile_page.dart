import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SetupProfilePage extends StatefulWidget{

  final String user;

  SetupProfilePage({this.user});

  @override
  State createState() => _SetupProfilePageState();
}

class _SetupProfilePageState extends State<SetupProfilePage>{



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Setup your Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('hello, ${widget.user}'),
      ),
    );
  }
}