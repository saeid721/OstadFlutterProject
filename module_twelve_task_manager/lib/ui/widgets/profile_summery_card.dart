import 'package:flutter/material.dart';

class ProfileSummeryCard extends StatelessWidget {
  const ProfileSummeryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(
        'Rabbil Hasan',
        style:
        TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        'rabbil@gmail.com',
        style: TextStyle(color: Colors.white),
      ),
      trailing: Icon(Icons.arrow_forward),
      tileColor: Colors.green,
    );
  }
}
