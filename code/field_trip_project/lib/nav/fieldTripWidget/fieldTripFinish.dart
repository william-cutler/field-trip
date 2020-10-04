import 'package:field_trip_project/data/activity.dart';
import 'package:field_trip_project/data/fieldTrip.dart';
import 'package:field_trip_project/data/task.dart';
import 'package:field_trip_project/nav/activityWidget/mapWidget.dart';
import 'package:field_trip_project/nav/taskWidget/taskWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FieldTripFinish extends StatelessWidget {
  final FieldTrip trip;

  FieldTripFinish({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: this.renderFinal(),
    ));
  }

  Widget renderFinal() {
    return SingleChildScrollView(
        reverse: true,
        child: Column(children: [
          ...this
              .trip
              .activities
              .map((activity) => this.renderFinalActivity(activity))
        ]));
  }

  Widget renderFinalActivity(Activity act) {
    return Column(children: [
      Text(act.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      Text(act.address,
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12)),
      Column(
          children: [...act.writtenTasks.map((task) => this.renderTask(task))])
    ]);
  }

  Widget renderTask(WritingTask task) {
    return Column(children: [
      Text(task.prompt,
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16)),
      Text(task.response)
    ]);
  }
}
