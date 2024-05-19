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
  late Future<Set<Map<String, SeatNumber>>> bookedSeatsFuture;

  @override
  void initState() {
    super.initState();
    // Instantiate SlotDB class
    SlotDB slotDB = SlotDB();
    bookedSeatsFuture =
        slotDB.getBookedSeatsByUser(widget.userID); // Convert Map values to Set
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Các vé đặt thành công'),
        backgroundColor: Colors.redAccent, // Đổi màu nền của appbar thành đỏ
      ),
      body: FutureBuilder<Set<Map<String, SeatNumber>>>(
        future: bookedSeatsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Không có vé đã đặt nào'));
          } else {
            Set<Map<String, SeatNumber>> bookedSeats = snapshot.data!;
            return ListView.builder(
              itemCount: bookedSeats.length,
              itemBuilder: (context, index) {
                Map<String, SeatNumber> seatMap = bookedSeats.elementAt(index);
                String seatKey = seatMap.keys.first;
                SeatNumber seat = seatMap[seatKey]!;
                return Card(
                  // Đổi sang sử dụng Card để hiển thị thông tin vé
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    title: Text(
                      'Hàng: ${seat.rowI + 1}, Cột: ${seat.colI + 1}',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red, // Đổi màu chữ sang đỏ
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
