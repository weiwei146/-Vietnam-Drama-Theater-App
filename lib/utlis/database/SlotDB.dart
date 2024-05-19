import 'dart:math';

import 'package:book_my_seat/book_my_seat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:namer_app/screen/booking/BookingScreen.dart';

class SlotDB {
    static String generateRandomID(int length) {
      const charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
      Random rand = Random();
      return List.generate(length, (index) => charset[rand.nextInt(charset.length)]).join();
    }

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

  static bool updateSlots(String id, Set<SeatNumber> slots, String userID) {
      print(userID);

    final db = FirebaseFirestore.instance;
    try {
      for (var slot in slots) {
        final slotData = <String, dynamic>{
          generateRandomID(10): {
            'row': slot.rowI,
            'col': slot.colI,
            'userID': userID,
          }
        };

        db.collection("slots")
          .doc(id)
          .update(slotData)
          .catchError((e) {
        print("Error writing document: $e");
          throw e; // Re-throw the error to be caught by the outer try-catch
        });
      }
      return true; // Return true if all updates are successful
    } catch (e) {
      return false; // Return false if any error occurs
    }
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
      currentSeatsState[soldSeats.elementAt(i).rowI]
          [soldSeats.elementAt(i).colI] = SeatState.sold;
    }
    return currentSeatsState;
  }
}
