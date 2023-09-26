import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.amberAccent,
            title: const Text('Module 6, Class 2'),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        "https://falconsolutionbd.com/public/front/images/logo/logo.png"),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        "https://falconsolutionbd.com/public/front/images/logo/logo.png"),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        "https://falconsolutionbd.com/public/front/images/logo/logo.png"),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        "https://www.facebook.com/photo/?fbid=2691942754355543&set=a.1381573642059134"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        "https://falconsolutionbd.com/public/front/images/logo/logo.png"),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        "https://falconsolutionbd.com/public/front/images/logo/logo.png"),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        "https://falconsolutionbd.com/public/front/images/logo/logo.png"),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        "https://www.facebook.com/photo/?fbid=2691942754355543&set=a.1381573642059134"),
                  ),
                ],
              ),
            ],
            ],
          )),
    );
  }
}
