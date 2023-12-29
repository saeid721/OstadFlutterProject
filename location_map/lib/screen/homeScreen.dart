import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../screen/locationScreen.dart';

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
        markers: {
          Marker(
            markerId: MarkerId('initialPosition'),
            position: LatLng(23.77849399608364, 90.36142162698427),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
            infoWindow: InfoWindow(
              title: 'This is title',
              snippet: 'This is Snippet'
            ),
            draggable: true,
            onDragEnd: (LatLng position){
              print(position);
            },
            onDragStart: (LatLng position){
              print(position);
            },onDrag: (LatLng position){
              print(position);
            },
            onTap: (){
              print('on tapped in map');
            },
            ),
          Marker(
            markerId: MarkerId('initialPosition'),
            position: LatLng(23.77849399608314, 90.36142162698417),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            infoWindow: InfoWindow(
              title: 'This is title',
              snippet: 'This is Snippet'
            ),
            draggable: true,
            onDragEnd: (LatLng position){
              print(position);
            },
            onDragStart: (LatLng position){
              print(position);
            },onDrag: (LatLng position){
              print(position);
            },
            onTap: (){
              print('on tapped in map');
            },
            ),
          Marker(
            markerId: MarkerId('initialPosition'),
            position: LatLng(23.77849399608375, 90.36142162698487),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            infoWindow: InfoWindow(
              title: 'This is title',
              snippet: 'This is Snippet'
            ),
            draggable: true,
            onDragEnd: (LatLng position){
              print(position);
            },
            onDragStart: (LatLng position){
              print(position);
            },onDrag: (LatLng position){
              print(position);
            },
            onTap: (){
              print('on tapped in map');
            },
            ),
        },
        polygons: {
          Polyline(
          polylineId: PolylineId('Basic-line'),
          color:  Colors.red,
          width: 6,
          visible: true,
          endCap: Cap.buttCap,
          jointType: JointType.mitered,
          patterns: [
            PatternItem.gap(10),
            PatternItem.dash(10),
            PatternItem.dot,
            PatternItem.dash(10),
          ],
          points: [
            LatLng(23.77849399608364, 90.36142162698427),
            LatLng(23.77849399608375, 90.36142162698487),
            LatLng(23.77849399608314, 90.36142162698417),
            LatLng(23.77849399608364, 90.36142162698427),
          ]
          ),
        },
      ),
    );
  }
}
