import 'package:field_trip_project/data/task.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final WritingTask task;
  final Function onChanged;
  final controller = TextEditingController();
  TextWidget({Key key, this.task, this.onChanged}) : super(key: key) {
    controller.text = this.task.response;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(this.task.prompt),
        TextField(
          maxLines: null,
          controller: this.controller,
        ),
        Center(
            child: Container(
          width: 100.0,
          child: RaisedButton(
              child: Text('Submit'),
              onPressed: () => {onChanged(controller.text)}),
        )),
      ],
    );
  }
}
