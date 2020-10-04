import 'package:field_trip_project/data/fieldTrip.dart';
import 'package:flutter/material.dart';

import 'fieldTripActivity.dart';

class FieldTripStart extends StatelessWidget {
  final FieldTrip trip;

  FieldTripStart({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('images/boston.jpg'),
              width: MediaQuery.of(context).size.width * 0.90,
            ),
            Text("Explore Old City Hall",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff565656),
                  fontSize: 24,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w400,
                )),
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
