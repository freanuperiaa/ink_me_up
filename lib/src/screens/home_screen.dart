import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ink_me_up/src/models/user_profile.dart';

class HomePageWidget extends StatefulWidget{
  final UserProfile userProfile;
  final VoidCallback goToArtists;
  final VoidCallback goToAppointments;
  HomePageWidget({this.userProfile, this.goToArtists, this.goToAppointments});

  @override
  State createState() => _HomePageWidgetState();
}


class _HomePageWidgetState extends State<HomePageWidget>{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Good day,', style: TextStyle(color: Colors.black87, fontSize: 32.0, fontWeight: FontWeight.w300),),
          Padding(
            padding: EdgeInsets.fromLTRB(100.0, 20.0, 0.0, 20.0),
            child: Row(
              children: <Widget>[
                Text('${widget.userProfile.firstName}', style: TextStyle(color: Colors.blueAccent, fontSize: 50.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),),
                Text('!', style: TextStyle(color: Colors.blueAccent, fontSize: 50.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    widget.goToAppointments();
                  },
                  child: Container(
                    width: 150.0,
                    height: 100.0,
                    child: Card(
                      color: Colors.blueAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.account_balance_wallet, color: Colors.white, size: 35.0,),
                            Text('Check Your', style: TextStyle(color: Colors.white),),
                            Text('Appointments', style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    widget.goToArtists();
                  },
                  child: Container(
                    width: 150.0,
                    height: 100.0,
                    child: Card(
                      color: Colors.blueAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.palette, color: Colors.white, size: 35.0,),
                            Text('See', style: TextStyle(color: Colors.white),),
                            Text('Artists', style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                child: Row(
                  children: <Widget>[
                    Text('You have ', style: TextStyle(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.w300),),
                    Text('2', style: TextStyle(color: Colors.blueAccent, fontSize: 28.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
                    Text(' ongoing appointments.', style: TextStyle(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.w300))
                  ],
                ),
              ),
            ),
          ),
          widget.userProfile.isArtist
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                    child: Row(
                      children: <Widget>[
                        Text('You have ', style: TextStyle(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.w300),),
                        Text('0', style: TextStyle(color: Colors.blueAccent, fontSize: 28.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
                        Text('requests for appointment.', style: TextStyle(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.w300))
                      ],
                    ),
                  ),
                ),
              )
            : Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                child: Row(
                  children: <Widget>[
                    Text('You have ', style: TextStyle(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.w300),),
                    Text('0', style: TextStyle(color: Colors.blueAccent, fontSize: 28.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
                    Text(' pending appointments.', style: TextStyle(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.w300))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
