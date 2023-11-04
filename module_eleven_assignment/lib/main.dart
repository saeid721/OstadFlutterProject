import 'package:flutter/material.dart';
import 'Screen/PhotoListScreen.dart';

void main() {
  runApp(const PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  const PhotoGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Gallery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: PhotoListScreen(),
    );
  }
}
