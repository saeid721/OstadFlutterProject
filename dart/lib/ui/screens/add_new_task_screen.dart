import 'package:flutter/material.dart';
import '../widgets/body_background.dart';
import '../widgets/profile_summery_card.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileSummeryCard(),
            Expanded(
              child: BodyBackground(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          'Add New Task',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'Subject'),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        TextFormField(
                          maxLines: 8,
                          decoration:
                              const InputDecoration(hintText: 'Description'),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child:
                                const Icon(Icons.arrow_circle_right_outlined),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
