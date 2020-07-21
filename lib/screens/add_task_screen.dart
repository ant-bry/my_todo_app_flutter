import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_todo_app/models/task_data.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                helperText: 'Required',
                border: OutlineInputBorder(),
              ),
              onChanged: (newText) {
                newTaskTitle = newText;
                print(newTaskTitle);
                if (newText == "") {
                  print("user typed and removed it");
                  newTaskTitle = null;
                }
              },
            ),
            FlatButton(
              color: Colors.black,
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                try {
                  if (newTaskTitle != null) {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                      msg: "$newTaskTitle added to the list",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.lightBlueAccent,
                      fontSize: 15.0,
                    );
                  } else {
                    print('Textfield must not be empty');

                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(
                          'Textfield must not be empty',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(
                              'Ok',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                        backgroundColor: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                      ),
                      barrierDismissible: false,
                    );
                  }
                } catch (e) {
                  print(e);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
