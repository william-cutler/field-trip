import 'package:field_trip_project/data/activity.dart';
import 'package:field_trip_project/data/fieldTrip.dart';
import 'package:field_trip_project/nav/fieldTripWidget/fieldTripWidget.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Activity> activities = [];
    activities.add(Activity());
    activities.add(Activity());
    activities.add(Activity());
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
}
