import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.title});

  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(AssetsPath.logo, width: 120,),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(height: 16,),
            const Text('Version 1.0',),
            const SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
