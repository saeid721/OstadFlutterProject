import 'package:flutter/material.dart';

import '../widgets/profile_summery_card.dart';
import '../widgets/summery_card.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({super.key});

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileSummeryCard(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
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
            Expanded(
              child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index){
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Title hear', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,),),
                      Text('Discription'),
                      Text('Date: 12-12-2023'),
                    ],
                  ),
                );
            },),),
          ],
        ),
      ),
    );
  }
}

