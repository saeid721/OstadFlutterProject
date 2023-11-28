import 'package:flutter/material.dart';

import '../widgets/profile_summery_card.dart';
import '../widgets/task_item_card.dart';

class CancelledTasksScreen extends StatefulWidget {
  const CancelledTasksScreen({super.key});

  @override
  State<CancelledTasksScreen> createState() => _CancelledTasksScreenState();
}

class _CancelledTasksScreenState extends State<CancelledTasksScreen> {
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
                  //return const TaskItemCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
