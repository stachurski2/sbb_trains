import 'package:sbb_trains/model/station.dart';

class Connection {
  final String startTime;
  final String endTime;
  final String duration;
  final int changes;
  final Station startStation;
  final Station endStation;
  Connection(this.startStation, this.endStation, this.startTime, this.endTime, this.duration, this.changes);
}