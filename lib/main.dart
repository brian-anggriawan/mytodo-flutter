import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home.dart';
import './models/task_data.dart';

void main() {
  runApp(MyTodoList());
}

class MyTodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHome(),
      ),
    );
  }
}
