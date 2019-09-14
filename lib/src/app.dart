import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:ink_me_up/src/screens/login_signup_page.dart';
import 'package:ink_me_up/src/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> getUser() async {
    return await _auth.currentUser();
  }

  var _hasUser = false;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      title: 'Ink Me Up!',
      home: _hasUser
              ? Scaffold()
              : LoginSignUpPage(),
      routes: <String, WidgetBuilder>{
        '/home': (context) => HomePage(),
        '/loginsignup': (context) => LoginSignUpPage(),
      },
    );
  }
}
