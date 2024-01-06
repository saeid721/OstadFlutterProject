import 'package:crafty_bay/presentation/ui/screens/auth/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBoy extends StatelessWidget {
  const CraftyBoy({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce Project - Crafty Bay',
      theme: AppThemeData.lightThemeData,
      home: const SplashScreen(title: 'Crafty Bay'),
    );
  }
}
