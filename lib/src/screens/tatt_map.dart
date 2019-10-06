import 'package:flutter/material.dart';


class TattMap extends StatefulWidget{
  @override
  State createState() => _TattMapState();
}


class _TattMapState extends State<TattMap>{

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: <Widget>[
          Text('Tatt Map'),
          Text('NOTE:', style: TextStyle(color: Colors.white30, fontWeight: FontWeight.w500, fontSize: 25.0)),
          Text('Need to have API Key from Google Maps, which also needs GCP')
        ],
      ),
    );
  }
}
