import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Module Eight Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Profile"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          final isPortrait = orientation == Orientation.portrait;

          return SingleChildScrollView(
            child:
                isPortrait ? const PortraitLayout() : const LandscapeLayout(),
          );
        },
      ),
    );
  }
}

class PortraitLayout extends StatelessWidget {
  const PortraitLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 20),
        const CircleAvatar(
          radius: 240,
          backgroundImage: NetworkImage(
              'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg'),
        ),
        const SizedBox(height: 20),
        const Text(
          "Minhazul Islam Saeid",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            3,
            (index) => Image.network(
              'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class LandscapeLayout extends StatelessWidget {
  const LandscapeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          flex: 1,
          child: CircleAvatar(
            radius: 240,
            backgroundImage: NetworkImage(
                'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg'),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                "Minhazul Islam Saeid",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  3,
                  (index) => Image.network(
                    'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
