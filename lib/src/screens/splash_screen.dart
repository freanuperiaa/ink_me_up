import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ink_me_up/src/models/user_profile.dart';

import 'package:ink_me_up/src/screens/home.dart';


class SplashScreen extends StatefulWidget{
  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  UserProfile userProfile;
  final _databaseReference = Firestore.instance;

  @override
  initState() {
    FirebaseAuth.instance
        .currentUser()
        .then((currentUser) {
      if (currentUser == null)
        {Navigator.pushReplacementNamed(context, '/loginsignup');}
      else
        {
          _databaseReference.collection('users')
              .where('user_id', isEqualTo: currentUser.uid)
              .getDocuments()
              .then((QuerySnapshot snapshot){
            setState(() {
              userProfile = UserProfile.fromJson(snapshot.documents[0].data);
            });
          });
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                    userProfile: userProfile,
                  )));
        }
    }).catchError((err) => print(err));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Loading..."),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

}