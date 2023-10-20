import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String activityName;
  final bool isDone;
  final Function(bool) action;
  final VoidCallback longPressAction;

  const Task(
      {required this.activityName,
      required this.isDone,
      required this.action,
      required this.longPressAction});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressAction,
      title: isDone
          ? Text(
              activityName,
              style: TextStyle(decoration: TextDecoration.lineThrough),
            )
          : Text(activityName),
      trailing: Checkbox(
          activeColor: Colors.blue,
          value: isDone ? true : false,
          onChanged: (value) => action(bool.parse(value.toString()))),
    );
  }
}
