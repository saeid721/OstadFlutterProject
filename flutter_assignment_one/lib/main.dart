import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 70.0, // elevation to 70
        toolbarHeight: 100.0, // height of the app bar to 100
        centerTitle: true,
        title: const Text(
          'Home', // app title
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add action here
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.add_business),
          onPressed: () {
            // Add action here
          },
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('This is module 5 Assignment'),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'My ',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Phone ',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Name ',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Samsung A50',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
