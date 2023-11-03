import 'package:flutter/material.dart';
import '../screens/product_list_screen.dart';

void main() {
  runApp(const CurdApp());
}

class CurdApp extends StatelessWidget {
  const CurdApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: ProductListScreen(),
    );
  }
}
