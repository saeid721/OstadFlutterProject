import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/network_coller/network_coller.dart';
import '../../data/network_coller/network_response.dart';
import '../../data/utility/urls.dart';
import '../../ui/widgets/snack_massage.dart';
import '../controller/new_task_controller.dart';
import '../widgets/body_background.dart';
import '../widgets/profile_summery_card.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _subjectTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _createTaskInProgress = false;

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
                    child: Form(
                      key: _formKey,
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
                            controller: _subjectTEController,
                            decoration:
                                const InputDecoration(hintText: 'Subject'),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter your subject';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          TextFormField(
                            controller: _descriptionTEController,
                            maxLines: 8,
                            decoration:
                                const InputDecoration(hintText: 'Description'),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter your description';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Visibility(
                              visible: _createTaskInProgress == false,
                              replacement: const Center(
                                child: CircularProgressIndicator(),
                              ),
                              child: ElevatedButton(
                                onPressed: createTask,
                                child: const Icon(
                                    Icons.arrow_circle_right_outlined),
                              ),
                            ),
                          )
                        ],
                      ),
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

  Future<void> createTask() async {
    if (_formKey.currentState!.validate()) {
      _createTaskInProgress = true;
      if (mounted) {
        setState(() {});
      }
      final NetworkResponse response =
          await NetworkCaller().postRequest(Urls.createNewTask, body: {
        "title": _subjectTEController.text.trim(),
        "description": _descriptionTEController.text.trim(),
        "status": "New"
      });
      _createTaskInProgress = false;
      if (mounted) {
        setState(() {});
      }
      if (response.isSuccess) {
        _subjectTEController.clear();
        _descriptionTEController.clear();

        Get.find<NewTaskController>().getNewTaskList();
        if (mounted) {
          showSnackMessage(context, 'New task added!');
        }
      } else {
        if (mounted) {
          showSnackMessage(context, 'Create new task failed! Try again.', true);
        }
      }
    }
  }

  @override
  void dispose() {
    _descriptionTEController.dispose();
    _subjectTEController.dispose();
    super.dispose();
  }
}
