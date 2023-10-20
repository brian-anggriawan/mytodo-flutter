import 'package:flutter/material.dart';
import 'task_model.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  final List<TaskModel> _tasks = [];

  void addTask(String activityName) {
    _tasks.add(TaskModel(activityName: activityName, isDone: false));
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleDone(TaskModel task) {
    task.toggleDone();
    notifyListeners();
  }

  UnmodifiableListView<TaskModel> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }
}
