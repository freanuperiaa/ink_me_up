import 'package:flutter/material.dart';

import 'package:ink_me_up/src/screens/login_signup_page.dart';
import 'package:ink_me_up/src/screens/home.dart';
import 'package:ink_me_up/src/screens/setup_profile_page.dart';
import 'package:ink_me_up/src/screens/splash_screen.dart';
import 'package:ink_me_up/src/utils/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: helper.themePrimaryColor,
      ),
      title: 'Ink Me Up!',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/loginsignup': (context) => LoginSignUpPage(),
        '/setupprofile': (context) => SetupProfilePage(),
      },
    );
  }
}
