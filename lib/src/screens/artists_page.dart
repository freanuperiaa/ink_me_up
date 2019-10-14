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

  List<UserProfile> _artistsList;
  final Firestore _databaseReference = Firestore.instance;

  static Future<List<UserProfile>> _getUsersFromFirestore() async {
    CollectionReference ref = Firestore.instance.collection('users');
    QuerySnapshot usersQuery = await ref
        .where("is_artist", isEqualTo: true)
        .getDocuments();

    Map<int, UserProfile> userMap = new Map<int, UserProfile>();

    int _currIndex = 0;
    usersQuery.documents.forEach((document) {
      userMap.putIfAbsent(_currIndex, () => (UserProfile(
          userId: document['user_id'],
          isArtist: document['is_artist'],
          firstName: document['first_name'],
          lastName: document['last_name'],
          phoneNumber: document['phone_number'],
          address1: document['address_1'],
          address2: document['address_2'],
          addressCity: document['address_city']
      ))
      );
      ++_currIndex;
    });

    return userMap.values.toList();
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder<List<UserProfile>>(
                future: _getUsersFromFirestore(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState != ConnectionState.done) {
                    // return: show loading widget
                  }
                  if(snapshot.hasError) {
                    // return: show error widget
                  }
                  List<UserProfile> users = snapshot.data ?? [];
                  return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        UserProfile user = users[index];
                        var artistTile = helper.getArtistCard('${user.firstName} ${user.lastName}', user.addressCity, (){});
                        return artistTile;
                      });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
