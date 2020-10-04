// import 'package:field_trip_project/data/activity.dart';
// import 'package:field_trip_project/data/fieldTrip.dart';
// import 'package:field_trip_project/nav/activityWidget/mapWidget.dart';
// import 'package:field_trip_project/nav/taskWidget/taskWidget.dart';
// import 'package:flutter/material.dart';

// class ActivityWidget extends StatelessWidget {
//   final FieldTrip trip;

//   const ActivityWidget({Key key, @required this.trip}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         reverse: true,
//         child: Column(children: [
//           Container(
//             height: 200,
//             child: MapWidget(loc: this.trip.getCurrActivity().location),
//           ),
//           Container(
//             height: 300,
//             child: ListView(children: [
//               ...this
//                   .trip
//                   .getCurrActivity()
//                   .writtenTasks
//                   .map((task) => TaskWidget(task: task))
//             ]),
//           ),
//           // ListView(children: [Text('asdas'), Text('asd11')]),
//         ]));
//   }
// }
