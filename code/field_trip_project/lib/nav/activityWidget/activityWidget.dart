import 'package:field_trip_project/data/activity.dart';
import 'package:field_trip_project/nav/activityWidget/mapWidget.dart';
import 'package:field_trip_project/nav/taskWidget/taskWidget.dart';
import 'package:flutter/material.dart';

class ActivityWidget extends StatefulWidget {
  final Activity activity;

  const ActivityWidget({Key key, this.activity}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ActivityWidgetState(activity);
  }
}

class ActivityWidgetState extends State<ActivityWidget> {
  Activity activity;

  ActivityWidgetState(this.activity);

  @override
  Widget build(BuildContext context) {
    print(this.activity.desciption);
    return SingleChildScrollView(
        reverse: true,
        child: Column(children: [
          Container(
            height: 200,
            child: MapWidget(loc: this.activity.location),
          ),
          Container(
            height: 300,
            child: ListView(children: [
              ...this
                  .activity
                  .writtenTasks
                  .map((task) => TaskWidget(task: task))
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
