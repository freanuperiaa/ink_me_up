import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget{

  final user;

  HomePage({this.user});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('INK ME UP'),),
      ),
      body: Center(
        child: Text(
            'Welcome, ${user.email}'
        ),
      ),
    );
  }
}