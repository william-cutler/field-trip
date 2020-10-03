import 'package:field_trip_project/data/activity.dart';
import 'package:field_trip_project/nav/activityWidget/mapWidget.dart';
import 'package:field_trip_project/nav/taskWidget/taskWidget.dart';
import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  final Activity activity;

  const ActivityWidget({Key key, this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        reverse: true,
        child: Column(children: [
          Container(
            height: 200,
            child: MapWidget(loc: this.activity.location),
          ),
          Container(
            height: 500,
            child: ListView(children: [
              ...activity.writtenTasks.map((task) => TaskWidget(task: task))
            ]),
          )
          // ListView(children: [Text('asdas'), Text('asd11')]),
        ]));
  }
}

// Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         TaskWidget(task: activity.writtenTasks[0]),
//       ],
//     )
//...activity.writtenTasks.map((task) => TaskWidget(task: task))
