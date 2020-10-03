import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  final String activityName;

  const ActivityWidget({Key key, this.activityName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(activityName);
  }
}
