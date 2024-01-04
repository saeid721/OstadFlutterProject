import 'package:crafty_bay/presentation/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class CraftyBoy extends StatelessWidget {
  const CraftyBoy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce Project - Crafty Bay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const SplashScreen(title: 'Crafty Bay'),
    );
  }
}
