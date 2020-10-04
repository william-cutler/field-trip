import 'package:field_trip_project/data/task.dart';
import 'package:flutter/material.dart';

class ResponseWidget extends StatelessWidget {
  final WritingTask task;
  final TextEditingController controller;

  const ResponseWidget({Key key, this.task, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (task.response == "") {
      return Text("");
    } else {
      return Text("Submitted");
    }
  }
}
