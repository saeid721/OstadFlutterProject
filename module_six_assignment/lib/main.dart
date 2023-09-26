import 'package:flutter/material.dart';

void main() {
  runApp(const PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  const PhotoGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhotoGalleryScreen(),
    );
  }
}

class PhotoGalleryScreen extends StatelessWidget {
  const PhotoGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Photo Gallery"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Welcome to My Photo Gallery!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Search for photos...",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Photos ${index + 1} clicked!'),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Image.network(
                            'https://as1.ftcdn.net/v2/jpg/04/73/67/64/1000_F_473676400_VyH1ey15WGBA6L9MILjha6thtMVfuRh2.jpg',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Photos ${index + 1}'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://as2.ftcdn.net/v2/jpg/02/66/72/41/1000_F_266724172_Iy8gdKgMa7XmrhYYxLCxyhx6J7070Pr8.jpg"),
              ),
              title: Text("Photo 1"),
              subtitle: Text("Description for Photo 1"),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://as2.ftcdn.net/v2/jpg/01/82/25/35/1000_F_182253513_g1U1140bP8g7Y9fyhrv8S3eRcHYpRlVy.jpg"),
              ),
              title: Text("Photo 2"),
              subtitle: Text("Description for Photo 2"),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://as2.ftcdn.net/v2/jpg/02/66/72/41/1000_F_266724172_Iy8gdKgMa7XmrhYYxLCxyhx6J7070Pr8.jpg"),
              ),
              title: Text("Photo 3"),
              subtitle: Text("Description for Photo 3"),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Photos Uploaded Successfully!"),
                  ),
                );
              },
              child: const Icon(Icons.upload_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
