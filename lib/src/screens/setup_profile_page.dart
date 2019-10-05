import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ink_me_up/src/models/user_profile.dart';
import 'package:ink_me_up/src/screens/home.dart';

import 'package:ink_me_up/src/utils/utils.dart';


class SetupProfilePage extends StatefulWidget{

  final String user;

  SetupProfilePage({this.user});

  @override
  State createState() => _SetupProfilePageState();
}

class _SetupProfilePageState extends State<SetupProfilePage>{

  CollectionReference db = Firestore.instance.collection('users');
  UserProfile userProfile;

  bool _yesSelected = false;
  bool _noSelected = false;
  var _firstNameController = TextEditingController();
  var _lastNameController = TextEditingController();
  var _address1Controller = TextEditingController();
  var _address2Controller = TextEditingController();
  var _cityController = TextEditingController();
  var _phoneNumController = TextEditingController();

  void submitUser(UserProfile user) async {
    print('reached here');
    Firestore.instance.collection('users')
    .add(user.toJson())
    .then((result) => {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            userProfile: user,
          )
        )
      )
    })
    .catchError((err) => print(err));

}

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
                    controller: _firstNameController,
                  )
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Last Name'
                ),
                controller: _lastNameController,
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
                controller: _address1Controller,
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Address Line 2'
                ),
                controller: _address2Controller,
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'City'
                ),
                controller: _cityController,
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
                  controller: _phoneNumController,
                ),
              ),
              RaisedButton(
                color: Colors.white,
                child: Text("SUBMIT", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500, fontSize: 15.0)),
                onPressed: () async {
                  userProfile = UserProfile(
                    userId: widget.user, phoneNumber: int.parse(_phoneNumController.text.toString()),
                    isArtist: _yesSelected, firstName: _firstNameController.text, lastName: _lastNameController.text,
                  address1: _address1Controller.text, address2: _address2Controller.text, addressCity: _cityController.text,
                  );
                  submitUser(userProfile);
                },
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
              )

            ],
          ),
        )
      )
    );
  }
}