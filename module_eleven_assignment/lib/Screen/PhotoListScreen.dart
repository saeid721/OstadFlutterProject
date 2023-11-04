import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/class.dart';
import 'PhotoDetailScreen.dart';

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});

  @override
  _PhotoListScreenState createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  List<Photo> photos = [];

  @override
  void initState() {
    super.initState();
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          photos = data.map((photoData) => Photo.fromJson(photoData)).toList();
        });
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text('Photo Gallery'),
      ),
      body: photos.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(photos[index].thumbnailUrl),
                  title: Text(photos[index].title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PhotoDetailScreen(photo: photos[index]),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
