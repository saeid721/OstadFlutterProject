import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  Location _location = Location();
  Set<Marker> _markers = {};
  Polyline _polyline;

  @override
  void initState() {
    super.initState();
    _location.onLocationChanged.listen((LocationData locationData) {
      updateMarkerAndPolyline(locationData);
    });

    // Fetch user's location every 10 seconds
    Timer.periodic(Duration(seconds: 10), (timer) async {
      LocationData locationData = await _location.getLocation();
      updateMarkerAndPolyline(locationData);
    });
  }

  void updateMarkerAndPolyline(LocationData locationData) {
    LatLng latLng = LatLng(locationData.latitude, locationData.longitude);
    _markers.add(
      Marker(
        markerId: MarkerId('myLocation'),
        position: latLng,
        onTap: () {
          _showInfoWindow(context, locationData);
        },
      ),
    );

    if (_polyline != null) {
      List<LatLng> points = _polyline.points.toList();
      points.add(latLng);
      setState(() {
        _polyline = Polyline(
          polylineId: PolylineId('polyline'),
          points: points,
        );
      });
    } else {
      _polyline = Polyline(
        polylineId: PolylineId('polyline'),
        points: [latLng],
      );
    }

    // Animate camera to current location
    _controller.future.then((controller) {
      controller.animateCamera(CameraUpdate.newLatLng(latLng));
    });
  }

  void _showInfoWindow(BuildContext context, LocationData locationData) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          child: Column(
            children: [
              ListTile(
                title: Text('My current location'),
                subtitle: Text(
                  'Lat: ${locationData.latitude}, Lng: ${locationData.longitude}',
                ),
              ),
            ],
          ),
        );
      },
    );
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
          zoom: 14,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _markers,
        polylines: {if (_polyline != null) _polyline},
      ),
    );
  }
}
