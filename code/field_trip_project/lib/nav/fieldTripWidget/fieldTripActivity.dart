import 'package:field_trip_project/data/activity.dart';
import 'package:field_trip_project/data/fieldTrip.dart';
import 'package:field_trip_project/nav/activityWidget/mapWidget.dart';
import 'package:field_trip_project/nav/taskWidget/taskWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fieldTripFinish.dart';

// A widget to render the current activity in the field trip
class FieldTripActivity extends StatelessWidget {
  final FieldTrip trip;

  FieldTripActivity({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!this.trip.started || this.trip.submitted) {
      throw "Trip must be in progress.";
    }
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff885566),
          title: Text(this.trip.name,
              style: TextStyle(
                color: Color(0xbcffffff),
                fontSize: 18,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                letterSpacing: 1.25,
              )),
          actions: this.getNavButtons(context),
        ),
        body: SingleChildScrollView(
            reverse: true,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 15),
                Text(this.trip.getCurrActivity().title,
                    style: TextStyle(
                      color: Color(0xff565656),
                      fontSize: 24,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    )),
                SizedBox(height: 15),
                this.renderActivity(this.trip.getCurrActivity(), context)
              ],
            ))));
  }

  // Render the given activity with Map widget, WritingTask widgets, and
  // navigation buttons
  Widget renderActivity(Activity currActivity, BuildContext context) {
    return SingleChildScrollView(
        reverse: true,
        child: Column(children: [
          Container(
            height: 200,
            decoration:
                BoxDecoration(border: Border.all(color: Color(0xff885566))),
            width: MediaQuery.of(context).size.width * 0.90,
            child: MapWidget(loc: this.trip.getCurrActivity().location),
          ),
          SizedBox(height: 5),
          Text(this.trip.getCurrActivity().address,
              style: TextStyle(
                color: Color(0xff565656),
                fontSize: 14,
                fontStyle: FontStyle.italic,
                fontFamily: "Helvetica Neue",
                fontWeight: FontWeight.w400,
              )),
          SizedBox(height: 5),
          Container(
            height: 390,
            child: ListView(children: [
              ...this
                  .trip
                  .getCurrActivity()
                  .writtenTasks
                  .map((task) => TaskWidget(task: task))
            ]),
          ),
        ]));
  }

  // Conditionally adding 'next', 'prev' and 'submit' buttons depending
  // on where user is in list of activities
  List<Widget> getNavButtons(BuildContext context) {
    List<Widget> navButtons = [];
    if (!this.trip.onFirstActivity()) {
      navButtons.add(IconButton(
          icon: const Icon(Icons.navigate_before),
          tooltip: 'Prev page',
          onPressed: () {
            this.trip.prevActivity();
            Navigator.pop(context);
          }));
    }
    if (!this.trip.onLastActivity()) {
      navButtons.add(IconButton(
          icon: const Icon(Icons.navigate_next),
          tooltip: 'Next page',
          onPressed: () {
            this.trip.nextActivity();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FieldTripActivity(trip: trip)),
            );
          }));
    } else {
      navButtons.add(IconButton(
          icon: const Icon(Icons.alarm_on_outlined),
          tooltip: 'Submit',
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
