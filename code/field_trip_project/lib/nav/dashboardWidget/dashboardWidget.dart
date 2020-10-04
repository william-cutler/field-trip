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
        body: Column(children: [
          Text("Welcome back, " + this.student.name),
          Text("My Field Trips"),
          //this.renderTripInList(this.student.trips.elementAt(0), context)
          Column(
              children: this.student.trips.map((trip) {
            return this.renderTripInList(trip, context);
          }).toList())
          /*ListView.builder(
              itemCount: this.student.trips.length,
              itemBuilder: (context, itemIndex) {
                return Card(
                    child: Text(this.student.trips.elementAt(itemIndex).name));
              })*/
        ]));
  }

  Widget renderTripInList(FieldTrip trip, BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FieldTripStart(trip: trip)),
          );
        },
        child: Card(
            child: Column(children: [
          Row(children: [
            Container(
                width: 100.0,
                height: 60.0,
                child: Center(
                    child: new Image.asset(trip.titleImgPath,
                        width: 100.0, height: 60.0))),
            Flexible(
                child: Column(children: [
              Text(trip.name, overflow: TextOverflow.clip),
              Text(trip.description, overflow: TextOverflow.clip)
            ]))
          ]),
        ])));
  }
}
