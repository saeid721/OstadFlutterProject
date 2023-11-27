import 'package:flutter/material.dart';

class ProfileSummeryCard extends StatelessWidget {
  const ProfileSummeryCard({
    super.key,
    this.enableOnTap = true,
  });

  final bool enableOnTap;

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text(
        'Falcon Solution Ltd',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      tileColor: Colors.green,
    );
  }
}
