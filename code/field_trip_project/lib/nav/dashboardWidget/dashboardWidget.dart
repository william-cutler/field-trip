import 'package:field_trip_project/data/fieldTrip.dart';
import 'package:field_trip_project/data/student.dart';
import 'package:field_trip_project/nav/activityWidget/mapWidget.dart';
import 'package:field_trip_project/nav/fieldTripWidget/fieldTripStart.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final Student student;

  Dashboard({Key key, @required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My Dashboard")),
        body: Padding(
            padding: EdgeInsets.all(4.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Positioned(
                left: 21,
                top: 761,
                child: Container(
                  width: 167,
                  height: 15,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Positioned(
                  left: 20,
                  top: 86,
                  child: SizedBox(
                    width: 274,
                    height: 37,
                    child: Text(
                      "Welcome back, " + this.student.name,
                      style: TextStyle(
                        color: Color(0xff565656),
                        fontSize: 24,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )),
              MapWidget(zoom: 13.0),
              SizedBox(
                height: 5.0,
              ),
              Text("My Field Trips",
                  style: TextStyle(
                    color: Color(0xff565656),
                    fontSize: 20,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w400,
                  )),
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
            ])));
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
