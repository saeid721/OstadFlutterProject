import 'package:flutter/material.dart';

class SummeryCard extends StatelessWidget {
  const SummeryCard({
    super.key, required this.count, required this.title,
  });
  final String count, title;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:
        EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.00),
        child: Column(
          children: [
            Text(
              '${count}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}