import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_todo_app/models/task_data.dart';
import 'package:my_todo_app/screens/task_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => new TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
