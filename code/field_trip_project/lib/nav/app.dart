import 'package:field_trip_project/nav/activityWidget/activityWidget.dart';
import 'package:field_trip_project/nav/taskWidget/taskWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Help',
      home: ActivityWidget(activityName: 'help me john'),
    );
  }
}
