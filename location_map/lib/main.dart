import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() => runApp(LocationMap());

class LocationMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  late LocationData currentLocation;
  late Location location;
  List<LatLng> polylineCoordinates = [];
  Set<Polyline> polylines = {};
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    location = new Location();
    location.onLocationChanged.listen((LocationData cLoc) {
      currentLocation = cLoc;
      updateMap();
    });
  }

  void updateMap() async {
    LatLng newLatLng = LatLng(currentLocation.latitude!, currentLocation.longitude!);
    polylineCoordinates.add(newLatLng);

    Polyline polyline = Polyline(
      polylineId: PolylineId("poly"),
      color: Colors.blue,
      width: 3,
      points: polylineCoordinates,
    );

    setState(() {
      markers.clear();
      markers.add(
        Marker(
          markerId: MarkerId("userLocation"),
          position: newLatLng,
          infoWindow: InfoWindow(
            title: "My current location",
            snippet: "Lat: ${currentLocation.latitude}, Lng: ${currentLocation.longitude}",
          ),
        ),
      );

      polylines.add(polyline);
    });

    mapController.animateCamera(CameraUpdate.newLatLng(newLatLng));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Map App'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0),
          zoom: 14.0,
        ),
        markers: markers,
        polylines: polylines,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          mapController = controller;
        },
      ),
    );
  }
}
