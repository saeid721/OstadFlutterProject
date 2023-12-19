import 'package:flutter/material.dart';

import '../screen/homeScreen.dart';

void main() {
  runApp(const GoogleMapApp());
}

class GoogleMapApp extends StatelessWidget {
  const GoogleMapApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Map App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const HomeScreen(title: 'Location & Map Apps'),
    );
  }
}
