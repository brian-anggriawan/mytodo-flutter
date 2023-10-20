import 'package:flutter/material.dart';

class TaskModel extends ChangeNotifier {
  final String activityName;
  bool isDone;

  TaskModel({required this.activityName, required this.isDone});

  void toggleDone() {
    isDone = !isDone;
  }
}
