import 'package:sbb_trains/model/station.dart';

class Connection {
   DateTime startTime;
   DateTime endTime;
   String duration;
  final int changes;
  final Station startStation;
  final Station endStation;
  Connection(this.startStation, this.endStation, String startTimeString, String endTimeString,  this.duration, this.changes) {
    this.startTime = DateTime.parse(startTimeString);
    this.endTime = DateTime.parse(endTimeString);
    duration = duration.replaceAll('00d', '').substring(0,duration.length-6);

  }
}