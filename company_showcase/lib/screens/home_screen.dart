import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Image.network(
              'https://addressmart.com/wp-content/uploads/2022/01/Falcon-Solution-Ltd-Logo.png'),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Company Description'),
          ),
        ],
      ),
    );
  }
}
