import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SeatSlot extends Equatable {
  String seatId;
  bool isOff;
  bool isBooked;
  bool isSelected;

  SeatSlot({
    required this.seatId,
    required this.isOff,
    required this.isBooked,
    required this.isSelected,
  });

  @override
  List<Object> get props => [seatId, isSelected];

  @override
  String toString() {
    return 'SeatSlot{seatId: $seatId}';
  }
}
