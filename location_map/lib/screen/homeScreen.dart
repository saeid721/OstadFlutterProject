import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController googleMapController;

  Location location = Location(),

  Future<void> getCurrentLocation()async{
    final LocationData locationData = await location.getLocation();
    if(locationData.isNull){
      return;
    }
    googleMapController.moveCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(locationData.longitude!, locationData.longitude!),),),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          zoom: 15,
          target: LatLng(23.77849399608364, 90.36142162698427),
          bearing: 0,
          tilt: 5,
        ),
        onTap: (LatLng position) {
          print(position);
        },
        onLongPress: (LatLng latLng) {
          print('On long press at $latLng');
        },
        onCameraMove: (cameraPosition) {
          print(cameraPosition);
        },
        onMapCreated: (GoogleMapController (controller) {
          googleMapController = controller;
          getCurrentLocation();
        }),
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        compassEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: {},
        polygons: {
          Polyline(polygonId: PolygonId('basic-line'),
          color: Colors.red,
          width: 6,
          visible: true,
          endCap: Cap.buttCap,
          ),
        }
      ),
    );
  }
}
