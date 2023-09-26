
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());  

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(title, {super.key, required this.title});
  final String title;  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello world'),
      )
    )
  }
}