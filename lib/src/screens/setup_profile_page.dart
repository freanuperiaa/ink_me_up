import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ink_me_up/src/utils/utils.dart';


class SetupProfilePage extends StatefulWidget{

  final String user;

  SetupProfilePage({this.user});

  @override
  State createState() => _SetupProfilePageState();
}

class _SetupProfilePageState extends State<SetupProfilePage>{

  bool _yesSelected = false;
  bool _noSelected = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Setup your Profile'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white70, helper.themeAccentColor],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(35.0),
          child: ListView(
            children: <Widget>[
              Text(
                  'Please enter your information below.',
                style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 30.0),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                    'Are you a tattoo artist?',
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w300, fontSize: 25.0)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: ChoiceChip(
                      backgroundColor: Colors.white70,
                      label: Text('YES'),
                      selected: _yesSelected,
                      onSelected: (selected){
                        setState(() {
                          _yesSelected = selected;
                          _noSelected = false;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: ChoiceChip(
                      backgroundColor: Colors.white70,
                      label: Text('NO'),
                      selected: _noSelected,
                      onSelected: (selected){
                        setState(() {
                          _noSelected = selected;
                          _yesSelected = false;
                        });
                      },
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                    'Name:',
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w300, fontSize: 25.0)
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'First Name'
                    ),
                  )
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Last Name'
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  'Address',
                  style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w300, fontSize: 25.0)
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Address Line 1'
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Address Line 2'
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'City'
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                    'Phone Number',
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w300, fontSize: 25.0)
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Phone Number (ex: 09XXXXXXXXX)'
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.white,
                child: Text("SUBMIT", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500, fontSize: 15.0)),
                onPressed: (){},
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
              )

            ],
          ),
        )
      )
    );
  }
}