import 'package:flutter/material.dart';
import '../../data/task.dart';
import 'textWidget.dart';
import 'responseWidget.dart';

class TaskWidget extends StatelessWidget {
  final WritingTask task;
  final TextEditingController controller;

  const TaskWidget({Key key, this.task, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responseWidget = ResponseWidget(task: task);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextWidget(
          task: task,
        ),
        responseWidget
      ],
    );
  }
}
