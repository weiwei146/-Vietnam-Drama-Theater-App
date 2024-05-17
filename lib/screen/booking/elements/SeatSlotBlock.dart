// import 'dart:async';
// import 'dart:collection';
// import 'package:bloc/bloc.dart';
//
// import '../../interface/Schedule.dart';
// import '../../interface/seat/SeatSlot.dart';
// import '../../interface/seat/TimeSlot.dart';
// import 'SeatSlotEvent.dart';
// import 'SeatSlotState.dart';
//
//
// class SeatSlotBlock extends Bloc<SeatSlotEvent, SeatSlotState> {
//   // late SessionRepository sessionRepository;
//   // late SeatSlotRepository seatSlotRepository;
//   late int seatCount;
//
//   HashMap<String, bool> selectedSeats = HashMap();
//
//   SeatSlotBlock({
//     // required this.sessionRepository,
//     // required this.seatSlotRepository,
//     required this.seatCount,
//   }) : super(SeatSlotState());
//
//   @override
//   SeatSlotState get initialState => SeatSlotState(isLoading: true);
//
//   @override
//   Stream<SeatSlotState> mapEventToState(
//       SeatSlotEvent event,
//       ) async* {
//     if (event is OpenScreen) {
//       yield* _mapOpenScreenToState();
//     } else if (event is ClickSelectSeatSlot) {
//       yield* _mapClickSelectSeatSlotToState(event.itemSeatSlotVM);
//     } else if (event is DismissMessageReachedLimitSeatSlot) {
//       yield state.copyWith(isReachedLimitSeatSlot: false);
//     } else if (event is DismissMessageWrongSeatType) {
//       yield state.copyWith(isSelectWrongSeatType: false);
//     } else if (event is ClickButtonPay) {
//       yield state.copyWith(isOpenPaymentMethod: true);
//     } else if (event is OpenedPaymentMethodScreen) {
//       yield state.copyWith(isOpenPaymentMethod: false);
//     }
//   }
//
//   Stream<SeatSlotState> _mapOpenScreenToState() async* {
//     try {
//       Schedule show
//       TimeSlot selectedTimeSlot
//
//       yield state.copyWith(
//         isLoading: false,
//         show: show,
//         selectedTimeSlot: selectedTimeSlot,
//         bookTimeSlot: bookTimeSlot,
//         itemGridSeatSlotVMs: toItemGridSeatSlotVMs(seatSlotByTypes),
//       );
//     } catch (e, s) {
//       print(s);
//       yield state.copyWith(
//         isLoading: false,
//         msg: e.toString(),
//       );
//     }
//   }
//
//   Stream<SeatSlotState> _mapClickSelectSeatSlotToState(
//       SeatSlot item) async* {
//     if (item.seatType == selectedSeatType) {
//       if (!selectedSeats.containsKey(item.seatId)) {
//         if (!isReachedLimitSlot()) {
//           selectedSeats[item.seatId] = true;
//           yield state.copyWith(
//             itemGridSeatSlotVMs: toItemGridSeatSlotVMs(seatSlotByTypes),
//             selectedSeatIds: getSelectedSeatSlotId(),
//             totalPrice: calculateTotalPrice(),
//           );
//         } else {
//           yield state.copyWith(isReachedLimitSeatSlot: true);
//         }
//       } else {
//         bool isSelected = !selectedSeats[item.seatId]!;
//         if ((isSelected && !isReachedLimitSlot()) || !isSelected) {
//           selectedSeats[item.seatId] = isSelected;
//           yield state.copyWith(
//             itemGridSeatSlotVMs: toItemGridSeatSlotVMs(seatSlotByTypes),
//             selectedSeatIds: getSelectedSeatSlotId(),
//             totalPrice: calculateTotalPrice(),
//           );
//         } else {
//           yield state.copyWith(isReachedLimitSeatSlot: true);
//         }
//       }
//     } else {
//       yield state.copyWith(isSelectWrongSeatType: true);
//     }
//   }
//
//   bool isReachedLimitSlot() {
//     return getSelectedSeatSlotId().length == seatCount;
//   }
//
//   List<String> getSelectedSeatSlotId() {
    // return selectedSeats.keys.where(
//           (key) {
//         return selectedSeats[key]!;
//       },
//     ).toList();
//   }
//
//   double calculateTotalPrice() {
//     return SeatType.SAMPLE_DATA
//         .firstWhere((type) => type.type == selectedSeatType)
//         .price *
//         getSelectedSeatSlotId().length;
//   }
//
//   @visibleForTesting
//   List<ItemGridSeatSlotVM> toItemGridSeatSlotVMs(
//       List<SeatType> seatSlotByTypes) {
//     return seatSlotByTypes.map(
//           (seatSlotType) {
//         final seatTypeName =
//             '\$ ${seatSlotType.price} ${seatSlotType.type.toText().toUpperCase()}';
//         final maxColumn = seatSlotType.seatRows[0].count + 1;
//
//         return ItemGridSeatSlotVM(
//           seatTypeName: seatTypeName,
//           maxColumn: maxColumn,
//           seatRowVMs:
//           _toItemSeatRowVMs(seatSlotType.seatRows, seatSlotType.type),
//         );
//       },
//     ).toList();
//   }
//
//   List<ItemSeatRowVM> _toItemSeatRowVMs(
//       List<SeatRow> seatRows, SEAT_TYPE seatType) {
//     return seatRows.map(
//           (seatRow) {
//         final itemRowName = '${seatRow.rowId}';
//         return ItemSeatRowVM(
//           itemRowName: itemRowName,
//           seatSlotVMs: _toSeatSlots(seatRow, seatRow.count, seatType),
//         );
//       },
//     ).toList();
//   }
//
//   List<SeatSlot> _toSeatSlots(
//       SeatRow seatRow, int count, SEAT_TYPE seatType) {
//     return Iterable<int>.generate(count).map(
//           (i) {
//         final seatId = "${seatRow.rowId}$i";
//
//         final isOff = seatRow.offs.contains(i);
//         final isBooked = seatRow.booked.contains(i);
//         final isSelected =
//             selectedSeats.containsKey(seatId) && selectedSeats[seatId]!;
//
//         return SeatSlot(
//           seatId: seatId,
//           isBooked: isBooked,
//           isOff: isOff,
//           isSelected: isSelected,
//           seatType: seatType,
//         );
//       },
//     ).toList();
//   }
// }
