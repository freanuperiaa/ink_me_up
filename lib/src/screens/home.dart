import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ink_me_up/src/models/user_profile.dart';
import 'package:ink_me_up/src/screens/setup_profile_page.dart';


class HomePage extends StatefulWidget{

  final String user;

  HomePage({this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  UserProfile userProfile;
  final _databaseReference = Firestore.instance;

  void getUserProfile(){
    _databaseReference.collection('users')
        .where('user_id', isEqualTo: widget.user)
        .getDocuments()
        .then((QuerySnapshot snapshot){
          setState(() {
            userProfile = UserProfile.fromJson(snapshot.documents[0].data);
          });
    });
  }

  @override
  void initState(){
    getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    print(userProfile);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('INK ME UP'),),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Welcome, ${userProfile.firstName}'),
          ],
        ),
      ),
    );
  }
}