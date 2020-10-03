import 'package:field_trip_project/data/task.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final WritingTask task;
  final Function onChanged;
  final contoller = TextEditingController();
  TextWidget({Key key, this.task, this.onChanged}) : super(key: key) {
    contoller.text = this.task.response;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(this.task.prompt),
        TextField(
          controller: this.contoller,
        ),
        RaisedButton(onPressed: () => {onChanged(contoller.text)})
      ],
    );
  }
}
