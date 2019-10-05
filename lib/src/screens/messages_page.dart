import 'package:flutter/material.dart';
import 'package:ink_me_up/src/models/user_profile.dart';

import 'package:ink_me_up/src/screens/create_appointment.dart';
import 'package:ink_me_up/src/utils/utils.dart';


class AppointmentsPage extends StatefulWidget{

  final UserProfile userProfile;

  AppointmentsPage({this.userProfile});

  @override
  State createState() => _AppointmentsPageState();
}


class _AppointmentsPageState extends State<AppointmentsPage>{

  bool hasNoAppointments = false;

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        Expanded(
          child: hasNoAppointments
              ?
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'you have no appointments yet. Please create one by clicking the button below.'
                ),
              )
              :
              Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  children: <Widget>[
                    helper.getAppointmentCard('appointment 1', 'loren ipsum dolor sit met'),
                    helper.getAppointmentCard('appointment 2', 'loren ipsum dolor sit met')
                  ],
                ),
              )
        ),
        RaisedButton(
          color: Colors.blue,
          child: Text('MAKE AN APPOINTMENT', style: TextStyle(color: Colors.white70),),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          onPressed: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CreateAppointmentPage(userProfile: widget.userProfile,)
              )
            );
          },
        )
      ],
    );
  }
}
