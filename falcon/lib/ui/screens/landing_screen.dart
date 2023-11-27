import 'package:flutter/material.dart';
import '../../ui/screens/main_bottom_nav_screen.dart';
import '../widgets/body_background.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    goToLogin();
  }

  Future<void> goToLogin() async {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainBottomNavScreen(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyBackground(
        child: Center(
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            width: 200,
          ),
        ),
      ),
    );
  }
}
