import 'package:field_trip_project/data/task.dart';
import 'package:flutter/material.dart';

class ResponseWidget extends StatelessWidget {
  final WritingTask task;

  const ResponseWidget({Key key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(task.response);
  }
}
