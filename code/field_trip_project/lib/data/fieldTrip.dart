import 'activity.dart';

// To represent the current state of the field trip, including which activity
// the user currently is on.
class FieldTrip {
  String name = "";
  String description = "";
  List<Activity> activities = [];
  int currActivity = 0;

  bool submitted = false;
  bool getSubmitted() => this.submitted;

  bool started = false;
  bool getStarted() => this.started;

  FieldTrip({this.name, this.description, this.activities});

  // Increments the current activity index if not currently on final activity
  void nextActivity() {
    if (this.onLastActivity()) {
      throw "Already at last activity.";
    } else {
      this.currActivity++;
    }
  }

  void prevActivity() {
    if (this.onFirstActivity()) {
      throw "Already at first activity.";
    } else {
      this.currActivity--;
    }
  }

  void submit() {
    if (!this.started) {
      throw "Trip must start before submission.";
    }
    this.submitted = true;
  }

  void start() {
    if (this.started) {
      throw "Trip already started.";
    }
    this.started = true;
  }

  bool onFirstActivity() {
    return this.currActivity <= 0;
  }

  bool onLastActivity() {
    return this.currActivity >= this.activities.length - 1;
  }

  Activity getCurrActivity() {
    return this.activities[this.currActivity];
  }
}
