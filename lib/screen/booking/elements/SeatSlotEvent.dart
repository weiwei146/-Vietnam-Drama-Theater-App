import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../interface/seat/SeatSlot.dart';

abstract class SeatSlotEvent extends Equatable {
  const SeatSlotEvent();
}

class OpenScreen extends SeatSlotEvent {
  @override
  List<Object> get props => [];
}

class ClickSelectSeatSlot extends SeatSlotEvent {
  SeatSlot seatSlot;

  ClickSelectSeatSlot({
    required this.seatSlot,
  });

  @override
  List<Object> get props => [seatSlot];
}

class DismissMessageWrongSeatType extends SeatSlotEvent {
  @override
  List<Object> get props => [];
}

class DismissMessageReachedLimitSeatSlot extends SeatSlotEvent {
  @override
  List<Object> get props => [];
}

class ClickButtonPay extends SeatSlotEvent {
  @override
  List<Object> get props => [DateTime.now().millisecond];
}

class OpenedPaymentMethodScreen extends SeatSlotEvent {
  @override
  List<Object> get props => [];
}
