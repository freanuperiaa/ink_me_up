import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:ink_me_up/src/utils/utils.dart';
import 'package:ink_me_up/src/models/user_profile.dart';


class HomeDrawer extends StatelessWidget{
  BuildContext context;
  UserProfile user;

  HomeDrawer({this.context, this.user});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  _logOut() async{
    await _auth.signOut().then((value){
      print("logging out...");
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                  'Welcome, ${user.firstName}.',
                style: helper.drawerHeaderTextStyle,
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/home_drawer_header5.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
          helper.getHeaderListTile('My Profile', Icons.account_circle, (){}),
          Divider(),
          helper.getHeaderListTile('About', Icons.help, (){}),
          Divider(),
          helper.getHeaderListTile('Logout', Icons.exit_to_app, _logOut),
          Divider(),
        ],
      ),
    );
  }
}