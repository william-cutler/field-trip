import 'package:flutter/material.dart';
import '../../data/task.dart';
import 'textWidget.dart';
import 'responseWidget.dart';

class TaskWidget extends StatefulWidget {
  final WritingTask task;

  const TaskWidget({Key key, this.task}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TaskWidgetState(this.task);
  }
}

class TaskWidgetState extends State<TaskWidget> {
  final WritingTask task;

  TaskWidgetState(this.task);

  @override
  Widget build(BuildContext context) {
    var responseWidget = ResponseWidget(task: task);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextWidget(
            task: task,
            onChanged: (text) => {
                  setState(() => {task.setResponse(text)})
                }),
        responseWidget
      ],
    );
  }
}
