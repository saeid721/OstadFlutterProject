import 'package:flutter/material.dart';

import '../widgets/profile_summery_card.dart';
import 'project_pictures_details.dart';

class ProjectPicturesScreen extends StatefulWidget {
  const ProjectPicturesScreen({super.key});

  @override
  State<ProjectPicturesScreen> createState() => _ProjectPicturesScreenState();
}

class _ProjectPicturesScreenState extends State<ProjectPicturesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummeryCard(),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ProjectPictures();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
