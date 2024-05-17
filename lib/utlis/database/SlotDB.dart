import 'package:book_my_seat/book_my_seat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:namer_app/screen/booking/BookingScreen.dart';

import '../../screen/interface/Schedule.dart';

class SlotDB {
  static Set<SeatNumber> getSlotsByMovieID(String id) {
    Set<SeatNumber> slots = Set();
    final db = FirebaseFirestore.instance;
    db.collection("slots").doc(id).get().then(
          (querySnapshot) {
        print("Successfully completed");
          querySnapshot.data()!.values.forEach((data) {
            SeatNumber seat = SeatNumber(rowI: data['row'], colI: data['col']);
            slots.add(seat);
          });
        return slots;
      },
      onError: (e) => print("Error completing: $e"),
    );
    return slots;
  }


  static List<List<SeatState>> generateListState(int rows, int cols, Set<SeatNumber> soldSeats) {
    List<List<SeatState>> currentSeatsState = List.generate(
      rows,
          (_) => List.generate(
        cols,
            (_) => SeatState.unselected,
      ),
    );
    for (int i = 0; i < soldSeats.length; i++) {
      currentSeatsState[soldSeats.elementAt(i).rowI][soldSeats.elementAt(i).colI] = SeatState.sold;
    }
    return currentSeatsState;
  }
}