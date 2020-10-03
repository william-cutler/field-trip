import 'Task.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Help',
      home: Activity(),
    );
  }
}

class Activity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ActivityState();
  }
}

class ActivityState extends State<Activity> {
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

class ResponseWidget extends StatelessWidget {
  final WritingTask task;

  const ResponseWidget({Key key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(task.response);
  }
}
