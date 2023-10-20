import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/container_content.dart';
import '../widgets/task.dart';
import '../widgets/custom_floating_button.dart';
import '../widgets/logo.dart';
import '../widgets/form_input.dart';
import '../models/task_data.dart';

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHome();
}

class _MyHome extends State<MyHome> {
  String activityName = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Logo(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'My Todo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${taskData.taskCount.toString()} Task',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ContainerContent(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Task(
                    activityName: taskData.tasks[index].activityName,
                    isDone: taskData.tasks[index].isDone,
                    action: (value) {
                      taskData.toggleDone(taskData.tasks[index]);
                    },
                    longPressAction: () {
                      taskData.deleteTask(index);
                    },
                  );
                },
                itemCount: taskData.taskCount,
              ),
            ),
          ],
        ),
        floatingActionButton: CustomFloatingButton(
          action: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: FormInput(
                    actionInput: (value) {
                      activityName = value;
                    },
                    actionButton: () {
                      if (activityName != '') {
                        taskData.addTask(activityName);
                        activityName = '';
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
