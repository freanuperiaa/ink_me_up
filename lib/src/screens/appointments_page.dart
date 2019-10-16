import 'package:flutter/material.dart';
import 'package:ink_me_up/src/models/user_profile.dart';

import 'package:ink_me_up/src/utils/utils.dart';


class AppointmentsPage extends StatefulWidget{

  final UserProfile userProfile;
  VoidCallback goToArtists;

  AppointmentsPage({this.userProfile, this.goToArtists});

  @override
  State createState() => _AppointmentsPageState();
}


class _AppointmentsPageState extends State<AppointmentsPage>{


  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width:150.0,
                          height:150.0,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              'assets/tattoo.jpg',
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: <Widget>[
                              Text('With:'),
                              Text('Freanu Peria', style: TextStyle(fontWeight:FontWeight.w400, fontSize: 20.0, fontStyle: FontStyle.italic),),
                              Text('Date:', ),
                              Text('Oct 10, 2019', style: TextStyle(fontWeight:FontWeight.w400, fontSize: 20.0, fontStyle: FontStyle.italic))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width:150.0,
                          height:150.0,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(
                              'assets/tattoo_1.jpg',
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: <Widget>[
                              Text('With:'),
                              Text('Christian Garcia', style: TextStyle(fontWeight:FontWeight.w400, fontSize: 20.0, fontStyle: FontStyle.italic),),
                              Text('Date:', ),
                              Text('Oct 13, 2019', style: TextStyle(fontWeight:FontWeight.w400, fontSize: 20.0, fontStyle: FontStyle.italic))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ),
          widget.userProfile.isArtist
            ? Container()
            : RaisedButton(
                color: Colors.blue,
                child: Text('MAKE AN APPOINTMENT', style: TextStyle(color: Colors.white70),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                onPressed: (){
                  widget.goToArtists();
                },
              )
        ],
      ),
    );
  }
}
