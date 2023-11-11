import 'package:flutter/material.dart';
import 'package:module_twelve_task_manager/ui/screens/add_new_task_screen.dart';
import '../widgets/profile_summery_card.dart';
import '../widgets/summery_card.dart';
import '../widgets/task_item_card.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({super.key});

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewTaskScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummeryCard(),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  children: [
                    SummeryCard(
                      count: '92',
                      title: 'New',
                    ),
                    SummeryCard(
                      count: '90',
                      title: 'Process',
                    ),
                    SummeryCard(
                      count: '99',
                      title: 'Completed',
                    ),
                    SummeryCard(
                      count: '95',
                      title: 'Cancelled',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const TaskItemCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
