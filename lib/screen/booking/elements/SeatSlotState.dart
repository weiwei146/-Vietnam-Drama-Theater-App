import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:namer_app/screen/interface/Schedule.dart';
import 'package:namer_app/screen/interface/seat/SeatSlot.dart';

import '../../interface/seat/TimeSlot.dart';

@freezed
abstract class SeatSlotState {
  const SeatSlotState({
    this.schedule,
    this.selectedTimeSlot,
    this.isLoading = false,
    this.itemGridSeatSlotVMs = const [],
    this.msg,
    this.isSelectWrongSeatType = false,
    this.isReachedLimitSeatSlot = false,
    this.selectedSeatIds = const [],
    this.totalPrice = 0,
    this.isOpenPaymentMethod = false,
  });

  // Properties of the booking state.
  final Schedule? schedule;
  final TimeSlot? selectedTimeSlot;
  final bool isLoading;
  final List<SeatSlot> itemGridSeatSlotVMs;
  final String? msg;
  final bool isSelectWrongSeatType;
  final bool isReachedLimitSeatSlot;
  final List<String> selectedSeatIds;
  final double totalPrice;
  final bool isOpenPaymentMethod;
}