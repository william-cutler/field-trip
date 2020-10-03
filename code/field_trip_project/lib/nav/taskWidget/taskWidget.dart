import 'package:flutter/material.dart';
import '../../data/task.dart';
import 'textWidget.dart';
import 'responseWidget.dart';

class TaskWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TaskWidgetState();
  }
}

class TaskWidgetState extends State<TaskWidget> {
  WritingTask task = WritingTask('Help us we are scared');

  @override
  Widget build(BuildContext context) {
    var responseWidget = ResponseWidget(task: task);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
              task: task,
              onChanged: (text) => {
                    setState(() => {task.setResponse(text)})
                  }),
          responseWidget
        ],
      ),
    );
  }
}
