import 'dart:math';

import 'package:book_my_seat/book_my_seat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:namer_app/screen/booking/BookingScreen.dart';

class SlotDB {
  static String generateRandomID(int length) {
    const charset =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random rand = Random();
    return List.generate(
        length, (index) => charset[rand.nextInt(charset.length)]).join();
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

  static Future<bool> updateSlots(
      String id, Set<SeatNumber> slots, String userID) async {
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

        DocumentSnapshot doc =
            await FirebaseFirestore.instance.collection("slots").doc(id).get();
        if (doc.exists) {
          db.collection("slots").doc(id).update(slotData).catchError((e) {
            print("Error writing document: $e");
            throw e; // Re-throw the error to be caught by the outer try-catch
          });
        } else {
          // Document does not exist, create it
          db.collection("slots").doc(id).set(slotData).catchError((e) {
            print("Error writing document: $e");
            throw e; // Re-throw the error to be caught by the outer try-catch
          });
        }
      }
      return true; // Return true if all updates are successful
    } catch (e) {
      return false; // Return false if any error occurs
    }
  }

  static List<List<SeatState>> generateListState(
      int rows, int cols, Set<SeatNumber> soldSeats) {
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

  static Future<Set<SeatNumber>> getBookedSeatsByUser(String userID) async {
    Set<SeatNumber> bookedSeats = {};
    final db = FirebaseFirestore.instance;
    try {
      QuerySnapshot snapshot = await db.collection("slots").get();
      for (var doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>?;
        data?.forEach((key, value) {
          print(value);
          print(userID);
          if (value['userID'] == userID) {
            SeatNumber seat =
                SeatNumber(rowI: value['row'], colI: value['col']);
            bookedSeats.add(seat);
          }
        });
      }
      print('Booked Seats: $bookedSeats');
    } catch (e) {
      print("Error fetching booked seats: $e");
    }
    return bookedSeats;
  }
}
