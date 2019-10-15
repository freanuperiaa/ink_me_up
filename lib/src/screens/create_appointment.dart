import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ink_me_up/src/models/user_profile.dart';


class CreateAppointmentPage extends StatefulWidget{

  final UserProfile userProfile;
  final UserProfile artistsProfile;
  //CollectionReference db = Firestore.instance.collection('appointments');

  CreateAppointmentPage({this.userProfile, this.artistsProfile});

  @override
  _CreateAppointmentPageState createState() => _CreateAppointmentPageState();
}

class _CreateAppointmentPageState extends State<CreateAppointmentPage> {

  var _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an Appointment'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        child: Column(
          children: <Widget>[
            Text(
              'Request an appointment with:',
              style: TextStyle(
                  fontSize: 28.0, fontWeight: FontWeight.w500, color: Colors.blueGrey[700]
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.account_circle, color: Colors.blueAccent, size: 40.0,),
                    Container(width: 50.0,),
                    Text(
                      '${widget.artistsProfile.firstName}',
                      style: TextStyle(
                          fontSize: 34.0, fontWeight: FontWeight.w600, color: Colors.blueAccent
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'input'
                      ),
                      controller: _textFieldController,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}