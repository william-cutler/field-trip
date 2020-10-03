import 'package:field_trip_project/data/fieldTrip.dart';
import 'package:field_trip_project/nav/activityWidget/activityWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FieldTripWidget extends StatefulWidget {
  final FieldTrip fieldTrip;

  const FieldTripWidget({Key key, this.fieldTrip}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FieldTripState(this.fieldTrip);
  }
}

class FieldTripState extends State<StatefulWidget> {
  FieldTrip trip;
  FieldTripState(FieldTrip trip) {
    this.trip = trip;
  }

  @override
  Widget build(BuildContext context) {
    if (!this.trip.getStarted()) {
      return this.beforeTrip();
    } else if (this.trip.getStarted() && !this.trip.getSubmitted()) {
      return this.duringTrip();
    } else {
      //Submission screen
      return Text("CONGRATS!");
    }
  }

  Widget beforeTrip() {
    return Scaffold(
      appBar: AppBar(title: Text(this.trip.name)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //TODO: Some kind of map

          //Title
          Text(this.trip.name),
          Text(this.trip.description),
          RaisedButton(
              child: Text("Start"),
              onPressed: () => setState(() => {this.trip.start()}))
        ],
      ),
    );
  }

  Widget duringTrip() {
    Row navRow = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: this.getNavButtons());
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text(this.trip.name)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ActivityWidget(activity: this.trip.getCurrActivity()),
          navRow
        ],
      ),
    );
  }

  // Conditionally adding 'next', 'prev' and 'submit' buttons depending
  // on where user is in list of activities
  List<Widget> getNavButtons() {
    List<Widget> navButtons = [];
    if (!this.trip.onFirstActivity()) {
      navButtons.add(RaisedButton(
          child: Text("Prev"),
          onPressed: () => setState(() => {this.trip.prevActivity()})));
    }
    if (!this.trip.onLastActivity()) {
      navButtons.add(RaisedButton(
          child: Text("Next"),
          onPressed: () => setState(() => {this.trip.nextActivity()})));
    } else {
      navButtons.add(RaisedButton(
          child: Text("Submit"),
          onPressed: () => setState(() => {this.trip.submit()})));
    }
    return navButtons;
  }
}
