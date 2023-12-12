import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_twelve_task_manager/ui/controller/auth_controller.dart';
import 'package:module_twelve_task_manager/ui/screens/login_screen.dart';
import 'package:module_twelve_task_manager/ui/widgets/snack_massage.dart';
import '../screens/edit_profile_screen.dart';

class ProfileSummeryCard extends StatefulWidget {
  const ProfileSummeryCard({
    super.key,
    this.enableOnTap = true,
  });

  final bool enableOnTap;

  @override
  State<ProfileSummeryCard> createState() => _ProfileSummeryCardState();
}

String base64String = AuthController.user?.photo ?? '';

class _ProfileSummeryCardState extends State<ProfileSummeryCard> {
  @override
  Widget build(BuildContext context) {
    if (base64String.startsWith('data:image')) {
      // Remove data URI prefix if present
      base64String =
          base64String.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), '');
    }

    Uint8List imageBytes = const Base64Decoder().convert(base64String);
    return ListTile(
      onTap: () {
        if (widget.enableOnTap) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditProfileScreen(),
            ),
          );
        }
      },
      leading: CircleAvatar(
        child: AuthController.user?.photo == null
            ? const Icon(Icons.person)
            : ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.memory(
                  imageBytes,
                  fit: BoxFit.cover,
                ),
              ),
      ),
      title: Text(
        fullName,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        AuthController.user?.email ?? '',
        style: const TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: () async {
          await Get.find<AuthController>().clearAuthData();
          Get.offAll(const LoginScreen());
        },
        icon: const Icon(Icons.logout),
      ),
      tileColor: Colors.green,
    );
  }

  String get fullName {
    return '${AuthController.user?.firstName ?? ''} ${AuthController.user?.lastName ?? ''}';
  }
}
