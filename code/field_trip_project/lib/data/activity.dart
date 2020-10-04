import 'task.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Activity {
  final LatLng location;
  final String title;
  final String address;
  String getDescription() => this.title;
  final List<WritingTask> writtenTasks;

  Activity(this.location, this.title, this.address, this.writtenTasks);

  String toString() {
    String result = this.title;
    for (WritingTask task in this.writtenTasks) {
      result += task.toString() + " ";
    }
    return result;
  }
}
