import 'package:flutter/material.dart';
import '../screens/product_list_screen.dart';

void main() {
  runApp(const CurdApp());
}

class CurdApp extends StatelessWidget {
  const CurdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductListScreen(),
    );
  }
}
