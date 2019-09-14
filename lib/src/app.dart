import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:ink_me_up/src/screens/login_signup_page.dart';
import 'package:ink_me_up/src/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  var _hasUser = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> getUser() async {
    return await _auth.currentUser();
  }
  @override
  Widget build(BuildContext context){
    Future<FirebaseUser> user = getUser();
    user != null
      ? _hasUser = true
      : _hasUser = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      title: 'Ink Me Up!',
      home: _hasUser
              ? HomePage(user: user,)
              : LoginSignUpPage(),
      routes: <String, WidgetBuilder>{
        '/home': (context) => HomePage(),
        '/loginsignup': (context) => LoginSignUpPage(),
      },
    );
  }
}
