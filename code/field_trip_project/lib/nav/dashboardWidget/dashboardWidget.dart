import 'package:field_trip_project/data/fieldTrip.dart';
import 'package:field_trip_project/data/student.dart';
import 'package:field_trip_project/nav/fieldTripWidget/fieldTripStart.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final Student student;

  Dashboard({Key key, @required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My Dashboard")),
        body: Center(
            child: Column(children: [
          Text(this.student.name),
          Text("My Field Trips"),
          this.renderTripInList(this.student.trips.elementAt(0), context)
          /*ListView(children: [
            ...this
                .student
                .trips
                .map((trip) => this.renderTripInList(trip, context))
          ])*/
          /*ListView.builder(
              itemCount: this.student.trips.length,
              itemBuilder: (context, itemIndex) {
                return Card(
                    child: Text(this.student.trips.elementAt(itemIndex).name));
              })*/
        ])));
  }

  Widget renderTripInList(FieldTrip trip, BuildContext context) {
    return Column(children: [
      Row(children: [
        Image(image: AssetImage(trip.titleImgPath)),
        Column(children: [Text(trip.name), Text(trip.description)])
      ]),
      RaisedButton(
          child: Text("More"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FieldTripStart(trip: trip)),
            );
          })
    ]);
  }
}
