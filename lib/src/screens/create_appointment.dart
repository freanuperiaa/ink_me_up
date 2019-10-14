import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ink_me_up/src/models/user_profile.dart';


class CreateAppointmentPage extends StatelessWidget{

  final UserProfile userProfile;
  final UserProfile artistsProfile;
  //CollectionReference db = Firestore.instance.collection('appointments');

  CreateAppointmentPage({this.userProfile, this.artistsProfile});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an Appointment'),
      ),
      body: Center(
        child: Text('client: ${userProfile.firstName} \nartist:${artistsProfile.firstName}'),
      ),
    );
  }
}