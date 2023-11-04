import 'package:flutter/material.dart';
import '../Model/class.dart';

class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  PhotoDetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Detail'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(photo.url),
          SizedBox(height: 16),
          Text('Title: ${photo.title}'),
          SizedBox(height: 8),
          Text('ID: ${photo.id}'),
        ],
      ),
    );
  }
}
