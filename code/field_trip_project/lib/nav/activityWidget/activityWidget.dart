import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  final String activityName;
  final Function onChanged;

  const ActivityWidget({Key key, this.activityName, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(activityName);
  }
}
