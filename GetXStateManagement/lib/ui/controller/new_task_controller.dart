import 'package:get/get.dart';

import '../../data/models/task_list_model.dart';
import '../../data/network_coller/network_coller.dart';
import '../../data/network_coller/network_response.dart';
import '../../data/utility/urls.dart';

class NewTaskController extends GetxController {
  bool _getNewTaskInProgress = false;

  TaskListModel _taskListModel = TaskListModel();
  bool get getNewTaskInProgress => _getNewTaskInProgress;
  TaskListModel get taskListModel => _taskListModel;

  Future<bool> getNewTaskList() async {
    bool isSuccess = false;
    _getNewTaskInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getNewTasks);
    _getNewTaskInProgress = false;
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.jsonResponse);
      return true;
    }
    update();
    return isSuccess;
  }
}
