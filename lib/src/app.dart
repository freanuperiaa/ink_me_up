import 'package:flutter/material.dart';

import 'package:ink_me_up/src/screens/login_signup_page.dart';
import 'package:ink_me_up/src/screens/home.dart';
import 'package:ink_me_up/src/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      title: 'Ink Me Up!',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/loginsignup': (context) => LoginSignUpPage(),
      },
    );
  }
}
