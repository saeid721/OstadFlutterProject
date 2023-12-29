import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location_map/screen/locationScreen.dart';


void main() => runApp(LocationMap());

class LocationMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocationScreen(),
    );
  }
}
