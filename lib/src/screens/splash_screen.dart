import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:ink_me_up/src/screens/home.dart';


class SplashScreen extends StatefulWidget{
  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  initState() {
    FirebaseAuth.instance
        .currentUser()
        .then((currentUser) {
      if (currentUser == null)
        {Navigator.pushReplacementNamed(context, '/loginsignup');}
      else
        {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                    user: currentUser.uid,
                  )));
        }
    })
        .catchError((err) => print(err));
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