import 'package:flutter/material.dart';
import 'package:my_todo_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:my_todo_app/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Card(
              elevation: 1,
              child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(task);
                },
                longPressCallback: () {
                  print('Long pressed!');
                  try {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(
                          'Delete this task?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              taskData.deleteTask(task);
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text(
                              'No',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                      ),
                      barrierDismissible: false,
                    );
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
