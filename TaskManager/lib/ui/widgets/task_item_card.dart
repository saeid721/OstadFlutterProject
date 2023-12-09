import 'package:flutter/material.dart';
import 'package:module_twelve_task_manager/data/network_coller/network_coller.dart';
import 'package:module_twelve_task_manager/data/utility/urls.dart';

import '../../data/models/task.dart';

enum TaskStatus {
  New,
  Progress,
  Completed,
  Cancelled,
}

class TaskItemCard extends StatefulWidget {
  const TaskItemCard({
    super.key,
    required this.task,
    required this.onStatusChanage,
    required this.showProgress,
  });
  final Task task;
  final VoidCallback onStatusChanage;
  final Function(bool) showProgress;

  @override
  State<TaskItemCard> createState() => _TaskItemCardState();
}

class _TaskItemCardState extends State<TaskItemCard> {
  Future<void> updateTaskStatus(String status) async {
    widget.showProgress(true);
    final response = await NetworkCaller()
        .getRequest(Urls.updateTaskStatus(widget.task.sId ?? '', status));
    if (response.isSuccess) {
      widget.onStatusChanage();
    }
    widget.showProgress(false);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.task.title ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(widget.task.description ?? ""),
            Text('Date: ${widget.task.createdDate}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    widget.task.status ?? 'New',
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                ),
                Wrap(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete_forever_outlined),
                    ),
                    IconButton(
                      onPressed: () {
                        showUpdateStatusModel();
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showUpdateStatusModel() {
    List<ListTile> items = TaskStatus.values
        .map((e) => ListTile(
              title: Text(e.name),
              onTap: () {
                updateTaskStatus(e.name);
                Navigator.pop(context);
              },
            ))
        .toList();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: items,
          ),
          actions: [
            ButtonBar(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
