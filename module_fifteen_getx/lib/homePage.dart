import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GetX Practce',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    'Welcome to',
                    'Falcon Solution Ltd',
                    snackPosition: SnackPosition.BOTTOM,
                    showProgressIndicator: true,
                    backgroundColor: Colors.amberAccent,
                    colorText: Colors.black,
                    borderRadius: 5,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    icon: const Icon(Icons.person, color: Colors.black),
                    duration: const Duration(seconds: 5),
                    animationDuration: const Duration(seconds: 5),
                    isDismissible: false,
                    progressIndicatorBackgroundColor: Colors.green,
                  );
                },
                child: const Text(
                  'SnackBar',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                  selectionColor: Colors.amberAccent,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                    title: 'Delete Alart',
                    titlePadding: const EdgeInsets.all(10),
                    titleStyle: const TextStyle(color: Colors.white),
                    middleText: "Once delete, you can't get in back",
                    middleTextStyle: const TextStyle(color: Colors.white),
                    backgroundColor: Colors.red,
                    radius: 5,
                    textConfirm: 'Confirm',
                    textCancel: 'Not Now',
                    cancelTextColor: Colors.white,
                    confirmTextColor: Colors.white,
                    onCancel: () => {
                          Get.back(closeOverlays: true),
                        },
                    onConfirm: () => {
                          Get.back(closeOverlays: true),
                        },
                    barrierDismissible: false,
                    content: const Column(
                      children: [
                        Text('Hell 01'),
                        Text('Hello 02'),
                        Text('Hello 03'),
                        Text('Hello 04'),
                        Text('Hello 05'),
                      ],
                    ));
              },
              child: const Text(
                'Dialog',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
