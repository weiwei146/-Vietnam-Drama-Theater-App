import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class TimeSlot extends Equatable {
  String id;
  String time;
  bool active;

  TimeSlot({required this.id, required this.time, required this.active});

  int get hour => int.parse(time.split(":").first);


  @override
  List<Object> get props => [id, time, active];

  @override
  String toString() {
    return 'TimeSlot{id: $id, time: $time, active: $active}';
  }
}