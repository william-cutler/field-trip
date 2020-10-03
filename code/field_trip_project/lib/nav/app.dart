import 'package:field_trip_project/data/activity.dart';
import 'package:field_trip_project/data/fieldTrip.dart';
import 'package:field_trip_project/data/task.dart';
import 'package:field_trip_project/nav/fieldTripWidget/fieldTripWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Activity> activities = [];
    activities.add(setUpActivity());
    activities.add(setUpActivity());
    activities.add(setUpActivity());
    print(activities.length.toString());

    return new MaterialApp(
      title: 'Help',
      home: FieldTripWidget(
          fieldTrip: FieldTrip(
              name: "First FT",
              description: "Our first FT",
              activities: activities)),
    );
  }

  Activity setUpActivity() {
    List<WritingTask> tasks = [];
    tasks.add(WritingTask('Why are i still here?'));
    tasks.add(WritingTask('Just to suffer?'));
    tasks.add(WritingTask('Every night I feel my leg disappear!'));
    LatLng loc = LatLng(51.5074, 0.1278);
    return Activity(loc, "Can you help me find my cat?", tasks);
  }
}
