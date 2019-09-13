import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Ink Me Up!',
      home: Splash(),

    );
  }
}

class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    if (1==1){ // in this condition, it should check if user is authenticated.
      print('');
      return Scaffold(
        appBar: AppBar(
          title: Text('Ink Me Up!'),
        ),
        body: Text('Welcome/home page here'),
      );
    }else{
      print('not yet authenticated');
      return Scaffold(
        appBar: AppBar(
          title: Text('Ink Me Up!'),
        ),
        body: Text('login/signup here'),
      );
    }
  }
}