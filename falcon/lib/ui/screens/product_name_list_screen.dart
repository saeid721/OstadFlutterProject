import 'package:flutter/material.dart';

import '../widgets/profile_summery_card.dart';
import 'project_pictures_details.dart';

class ProductNameListScreen extends StatefulWidget {
  const ProductNameListScreen({super.key});

  @override
  State<ProductNameListScreen> createState() => _ProductNameListScreenState();
}

class _ProductNameListScreenState extends State<ProductNameListScreen> {
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
