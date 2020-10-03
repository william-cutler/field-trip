import 'Task.dart';
import 'package:flutter/material.dart';

//Primary application class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Help',
      home: Activity(),
    );
  }
}

// An Activity is a StatefulWidget with a state called "ActivityState"
class Activity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ActivityState();
  }
}

//A state that contains the writing task
class ActivityState extends State<Activity> {
  WritingTask task = WritingTask('Help us we are scared');

  @override
  Widget build(BuildContext context) {
    var responseWidget = ResponseWidget(task: this.task);
    //Google Maps would go here
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
              task: this.task,
              onChanged: (text) => {
                    setState(() => {this.task.setResponse(text)})
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
          controller: this.controller,
        ),
        RaisedButton(onPressed: () => {onChanged(controller.text)})
      ],
    );
  }
}

// To display the text given to the text box
class ResponseWidget extends StatelessWidget {
  final WritingTask task;

  ResponseWidget({Key key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(task.response);
  }
}
