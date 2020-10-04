import 'package:field_trip_project/data/activity.dart';
import 'package:field_trip_project/data/fieldTrip.dart';
import 'package:field_trip_project/data/student.dart';
import 'package:field_trip_project/data/task.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dashboardWidget/dashboardWidget.dart';
import 'fieldTripWidget/fieldTripStart.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Activity> activities = [];
    Activity harvard = Activity(
        LatLng(42.3770, -71.1167),
        "Walk around Harvard's campus.",
        "0 Harvard Square, Cambridge, MA 02138", [
      WritingTask("When was Harvard founded?"),
      WritingTask("What building looked the coolest to you?")
    ]);
    Activity copley = Activity(LatLng(42.3432, -71.0726), "Copley Square.",
        "206 Clarendon St, Boston, MA 02116", [
      WritingTask("When was the Church in Copley square built?"),
      WritingTask("What public building is across the square from the church?")
    ]);
    Activity brookline = Activity(LatLng(42.3427, -71.1225), "Brookline.",
        "290 Harvard St, Brookline, MA 02446", [
      WritingTask(
          "What famous theater in Brookline shares a name with a U.S. president?")
    ]);
    activities.add(harvard);
    activities.add(copley);
    activities.add(brookline);

    FieldTrip bostonTrip = FieldTrip(
        name: "Boston Historical Field Trip",
        description:
            "A field trip along some of the most popular historical destinations.",
        titleImgPath: 'images/boston.jpg',
        activities: activities);

    FieldTrip outdoorTrip = FieldTrip(
        name: "Local Outdoor Field Trip",
        description:
            "A field trip along some of the most popular historical destinations.",
        titleImgPath: 'images/outdoor.jpg',
        activities: activities);

    FieldTrip mfaTrip = FieldTrip(
        name: "MFA Outdoor Art",
        description:
            "Tour art pieces featured outside of the Boston Museum of Fine Arts.",
        titleImgPath: 'images/mfa.jpg',
        activities: activities);

    Student brittney =
        Student(name: "Brittney", trips: [bostonTrip, outdoorTrip, mfaTrip]);
    return new MaterialApp(title: 'FT App', home: Dashboard(student: brittney));
  }
}
