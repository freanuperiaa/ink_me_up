import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ink_me_up/src/models/user_profile.dart';
import 'package:ink_me_up/src/screens/create_appointment.dart';

import 'package:ink_me_up/src/utils/utils.dart';


class ArtistsPage extends StatefulWidget{

  final UserProfile userProfile;

  ArtistsPage({this.userProfile});

  @override
  State createState() => _ArtistsPageState();
}


class _ArtistsPageState extends State<ArtistsPage>{

  @override
  Widget build(BuildContext context){
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            helper.getArtistCard(
                'freanu peria',
                'Gensan City',
                (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateAppointmentPage(
                        userProfile: widget.userProfile,
                        artistsProfile: widget.userProfile, // FIXME:  this should be changed,  when artists are requested dynamically,
                                                            // FIXME:   artist's information should also be passed to CreateAppointmentPage()
                      )
                    )
                  );
                }
            ),
            helper.getArtistCard(
                'Bryan Pacis',
                'Quezon City',
                    (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateAppointmentPage(
                            userProfile: widget.userProfile,
                            artistsProfile: widget.userProfile, // FIXME:  this should be changed,  when artists are requested dynamically,
                            // FIXME:   artist's information should also be passed to CreateAppointmentPage()
                          )
                      )
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}
