import 'package:field_trip_project/data/activity.dart';
import 'package:field_trip_project/data/fieldTrip.dart';
import 'package:field_trip_project/data/task.dart';
import 'package:field_trip_project/nav/activityWidget/mapWidget.dart';
import 'package:field_trip_project/nav/taskWidget/taskWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FieldTripFinish extends StatelessWidget {
  final FieldTrip trip;

  FieldTripFinish({Key key, @required this.trip}) : super(key: key);

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
          child: this.renderFinal(context),
        ));
  }

  Widget renderFinal(BuildContext context) {
    return SingleChildScrollView(
        reverse: true,
        child: Column(children: [
          Image(
            image: AssetImage('images/boston.jpg'),
            height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 0.90,
          ),
          SizedBox(
            height: 10,
          ),
          ...this
              .trip
              .activities
              .map((activity) => this.renderFinalActivity(activity, context)),
          SizedBox(
            height: 2,
          )
        ]));
  }

  Widget renderFinalActivity(Activity act, BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * .90,
        child: Column(children: [
          SizedBox(
            height: 5,
          ),
          Text(act.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff565656),
                fontSize: 24,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w400,
              )),
          Text(act.address,
              style: TextStyle(
                color: Color(0xff565656),
                fontSize: 10,
                fontStyle: FontStyle.italic,
                fontFamily: "Helvetica Neue",
                fontWeight: FontWeight.w200,
              )),
          Column(children: [
            ...act.writtenTasks.map((task) => this.renderTask(task, context))
          ]),
          Container(
            color: Color(0xff565656),
            height: 1,
            width: MediaQuery.of(context).size.width * .95,
          )
        ]));
  }

  Widget renderTask(WritingTask task, BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.90,
        child: Column(children: [
          Text(task.prompt,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Helvetica Neue",
                fontWeight: FontWeight.w400,
              )),
          Text(task.response,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontFamily: "Helvetica Neue",
                fontWeight: FontWeight.w200,
              )),
          SizedBox(
            height: 5,
          )
        ]));
  }
}
