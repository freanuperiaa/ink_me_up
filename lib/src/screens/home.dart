import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ink_me_up/src/models/user_profile.dart';
import 'package:ink_me_up/src/screens/artists_page.dart';
import 'package:ink_me_up/src/screens/messages_page.dart';
import 'package:ink_me_up/src/screens/tatt_map.dart';
import 'package:ink_me_up/src/widgets/home_drawer.dart';
import 'package:ink_me_up/src/screens/home_screen.dart';


class HomePage extends StatefulWidget{

  final UserProfile user;
  HomePage({this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _databaseReference = Firestore.instance;
  //bottomNavigationBar vars
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        title:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("INK ME UP!"),
          ],
        ),
      ),
      drawer: HomeDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5.0,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.palette),
            title: Text('Artists'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            title: Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Tatt Map'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),

      body: new IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          HomePageWidget(),
          ArtistsPage(),
          MessagesPage(),
          TattMap(),
        ],
      ),
    );
  }
}