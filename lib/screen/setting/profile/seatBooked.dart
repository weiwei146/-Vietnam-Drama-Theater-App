import 'package:flutter/material.dart';
import 'package:namer_app/utlis/database/SlotDB.dart';

import '../../booking/BookingScreen.dart';

class UserBookedSeatsScreen extends StatefulWidget {
  final String userID;

  UserBookedSeatsScreen({Key? key, required this.userID}) : super(key: key);

  @override
  _UserBookedSeatsScreenState createState() => _UserBookedSeatsScreenState();
}

class _UserBookedSeatsScreenState extends State<UserBookedSeatsScreen> {
  late Future<Set<SeatNumber>> bookedSeatsFuture;

  @override
  void initState() {
    super.initState();
    bookedSeatsFuture = SlotDB.getBookedSeatsByUser(widget.userID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booked Seats'),
      ),
      body: FutureBuilder<Set<SeatNumber>>(
        future: bookedSeatsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No booked seats found.'));
          } else {
            Set<SeatNumber> bookedSeats = snapshot.data!;
            return ListView.builder(
              itemCount: bookedSeats.length,
              itemBuilder: (context, index) {
                SeatNumber seat = bookedSeats.elementAt(index);
                return ListTile(
                  title:
                      Text('Row: ${seat.rowI + 1}, Column: ${seat.colI + 1}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
