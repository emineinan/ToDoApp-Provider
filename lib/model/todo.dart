import 'package:flutter/cupertino.dart';
import 'package:todoapp/model/task.dart';

class TodoModel extends ChangeNotifier {
  List<TaskModel> taskList = [];

  addTaskInList() {
    TaskModel taskModel = TaskModel("title ${taskList.length}",
        "this is the task no detail ${taskList.length}");
    taskList.add(taskModel);

    notifyListeners();
  }
}
