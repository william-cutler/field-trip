import 'package:field_trip_project/data/fieldTrip.dart';
import 'package:flutter/material.dart';

import 'fieldTripActivity.dart';

class FieldTripStart extends StatelessWidget {
  final FieldTrip trip;

  FieldTripStart({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(image: AssetImage(this.trip.titleImgPath)),
        Text(this.trip.name),
        Text(this.trip.description),
        RaisedButton(
          child: Text("Start"),
          onPressed: () {
            this.trip.start();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FieldTripActivity(trip: trip)),
            );
          },
        ),
      ],
    )));
  }
}
