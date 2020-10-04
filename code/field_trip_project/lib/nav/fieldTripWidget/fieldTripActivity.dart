import 'package:field_trip_project/data/activity.dart';
import 'package:field_trip_project/data/fieldTrip.dart';
import 'package:field_trip_project/nav/activityWidget/mapWidget.dart';
import 'package:field_trip_project/nav/taskWidget/taskWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fieldTripFinish.dart';

class FieldTripActivity extends StatelessWidget {
  final FieldTrip trip;

  FieldTripActivity({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this.trip.toString());
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(this.trip.getCurrActivity().title),
        this.renderActivity(this.trip.getCurrActivity()),
        Row(children: this.getNavButtons(context)),
      ],
    )));
  }

  Widget renderActivity(Activity currActivity) {
    return SingleChildScrollView(
        reverse: true,
        child: Column(children: [
          Container(
            height: 200,
            child: MapWidget(loc: this.trip.getCurrActivity().location),
          ),
          Text(this.trip.getCurrActivity().address),
          Container(
            height: 300,
            child: ListView(children: [
              ...this
                  .trip
                  .getCurrActivity()
                  .writtenTasks
                  .map((task) => TaskWidget(task: task))
            ]),
          ),
          // ListView(children: [Text('asdas'), Text('asd11')]),
        ]));
  }

  // Conditionally adding 'next', 'prev' and 'submit' buttons depending
  // on where user is in list of activities
  List<Widget> getNavButtons(BuildContext context) {
    List<Widget> navButtons = [];
    if (!this.trip.onFirstActivity()) {
      navButtons.add(RaisedButton(
          child: Text("Prev"),
          onPressed: () {
            this.trip.prevActivity();
            Navigator.pop(context);
          }));
    }
    if (!this.trip.onLastActivity()) {
      navButtons.add(RaisedButton(
          child: Text("Next"),
          onPressed: () {
            this.trip.nextActivity();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FieldTripActivity(trip: trip)),
            );
          }));
    } else {
      navButtons.add(RaisedButton(
          child: Text("Submit"),
          onPressed: () {
            this.trip.submit();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FieldTripFinish(trip: trip)),
            );
          }));
    }
    return navButtons;
  }
}
