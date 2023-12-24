import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Location location = Location();
  LocationData? currentLocation;
  LocationData? myLocation;
  late StreamSubscription locationSubscription;

  @override
  void initState() {
    super.initState();
    listenToLocation();
  }

  void listenToLocation() {
    locationSubscription = location.onLocationChanged.listen((locationData) {
      myLocation = locationData;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'My location ${myLocation?.latitude ?? ''} ${myLocation?.longitude}'),
          Text(
              'My Location ${currentLocation?.latitude ?? ''} ${currentLocation?.longitude}'),
          ElevatedButton(
            onPressed: () async {
              currentLocation = await location.getLocation();
              print(currentLocation?.latitude);
              print(currentLocation?.longitude);
              print(currentLocation?.altitude);
              if (mounted) {
                setState(() {});
              }
            },
            child: const Text('Get current location'),
          ),
          const Text('Has permission'),
          ElevatedButton(
            onPressed: () async {
              PermissionStatus status = await location.hasPermission();
              if (status == PermissionStatus.denied ||
                  status == PermissionStatus.deniedForever) {
                await location.requestPermission();
                await location.getLocation();
              }
            },
            child: const Text('Get permission'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    locationSubscription.cancel();
    super.dispose();
  }
}
