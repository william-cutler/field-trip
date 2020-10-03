import 'task.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Activity {
  final LatLng location;
  final String desciption;
  final List<WritingTask> writtenTasks;

  Activity(this.location, this.desciption, this.writtenTasks);
}
