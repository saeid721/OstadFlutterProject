import 'package:flutter/material.dart';
import '../screens/product_list_screen.dart';

void main() {
  runApp(const CurdApp());
}

class CurdApp extends StatelessWidget {
  const CurdApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CURD REST API Apps',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: ProductListScreen(),
    );
  }
}
