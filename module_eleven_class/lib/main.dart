import 'package:flutter/material.dart';
import '../screens/product_list_screen.dart';

void main() {
  runApp(const CurdApp());
}

class CurdApp extends StatelessWidget {
  const CurdApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      title: 'CURD REST API Apps',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
=======
      theme: ThemeData(primarySwatch: Colors.green),
>>>>>>> 887a9fff54b46067310818c970266575c0e9e4dd
      home: ProductListScreen(),
    );
  }
}
