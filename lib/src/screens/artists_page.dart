import 'package:flutter/material.dart';


class ArtistsPage extends StatefulWidget{
  @override
  State createState() => _ArtistsPageState();
}


class _ArtistsPageState extends State<ArtistsPage>{

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: <Widget>[
          Text('Artists'),
        ],
      ),
    );
  }
}
