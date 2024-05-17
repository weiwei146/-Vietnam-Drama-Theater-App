import 'dart:ui';

import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../schedule/scheduleDetails/ScheduleDetails.dart';


class BookingScreen extends StatefulWidget {
  final BuildContext context;
  final Set<SeatNumber>selectedSeats;
  final String title;
  const BookingScreen({
    Key? key,
    required this.context,
    required this.selectedSeats,
    required this.title,
  }) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  Set<SeatNumber> selectedSeats = Set();
  late String title;
  int payment = 0;
  void updatePayment() {
    setState(() {
      // Update the state variable
      payment = selectedSeats.length * 70000;
    });
  }

  @override
  void initState() {
    // Initialize selectedSeats with the value passed from the widget
    selectedSeats = widget.selectedSeats;
    title = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack (
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Color(0xffA12830), // Background color
                  child: Padding(
                        padding: const EdgeInsets.only(left: 16, top: 40, bottom: 10),
                        child: Stack(
                          children: [
                            CreateIcons(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                CupertinoIcons.back,
                                color: Color(0xffA12830),
                              ),
                            ),
                            Center(
                              child: Container(
                                child: Text(
                                  'Lựa chọn vị trí ngồi',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                  ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                      bottom: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffA12830).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Sân khấu',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffA12830),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/images/svg_sold_bus_seat.svg',
                            width: 15,
                            height: 15,
                          ),
                          SizedBox(width: 4,),
                          const Text('Đã được đặt')
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/images/svg_unselected_bus_seat.svg',
                            width: 15,
                            height: 15,
                          ),
                          SizedBox(width: 4,),
                          const Text('Còn trống')
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/images/svg_selected_bus_seats.svg',
                            width: 15,
                            height: 15,
                          ),
                          SizedBox(width: 4,),
                          const Text('Đã được bạn chọn')
                        ],
                      ),
                    ],
                  ),
                ),

                Flexible(

                  child: LayoutBuilder(
                    builder: (context, constraints) {
                    final desiredHeight = 40.0 * 10;

                    return InteractiveViewer(
                        panEnabled: true,
                        scaleEnabled: true,
                        minScale: 0.5,
                        maxScale: 2.0,
                        child: SizedBox(
                          height: desiredHeight,
                          child:SeatLayoutWidget(
                            onSeatStateChanged: (rowI, colI, seatState) {
                              if (seatState == SeatState.selected) {
                                  selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));
                                } else {
                                  selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                                }
                              updatePayment();
                            },
                            stateModel: const SeatLayoutStateModel(
                              pathDisabledSeat: 'assets/images/svg_disabled_bus_seat.svg',
                              pathSelectedSeat: 'assets/images/svg_selected_bus_seats.svg',
                              pathSoldSeat: 'assets/images/svg_sold_bus_seat.svg',
                              pathUnSelectedSeat: 'assets/images/svg_unselected_bus_seat.svg',
                              rows: 10,
                              cols: 10,
                              seatSvgSize: 40,
                              currentSeatsState: [
                                [
                                  SeatState.sold,
                                  SeatState.sold,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.sold,
                                ],
                                [
                                  SeatState.sold,
                                  SeatState.sold,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.sold,
                                ],
                                [
                                  SeatState.sold,
                                  SeatState.sold,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.sold,
                                ],
                                [
                                  SeatState.sold,
                                  SeatState.sold,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.sold,
                                ],
                                [
                                  SeatState.sold,
                                  SeatState.sold,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.sold,
                                ],
                                [
                                  SeatState.sold,
                                  SeatState.sold,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.sold,
                                ],
                                [
                                  SeatState.sold,
                                  SeatState.sold,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.sold,
                                ],
                                [
                                  SeatState.sold,
                                  SeatState.sold,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.sold,
                                ],
                                [
                                  SeatState.sold,
                                  SeatState.sold,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.sold,
                                ],
                                [
                                  SeatState.sold,
                                  SeatState.sold,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.sold,
                                ],
                              ],
                            ),
                          ),
                        ),
                    );
                  })
                ),

            ],
        ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200.0,
              decoration: BoxDecoration(
                color: Color(0xffA12830),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    height: 150.0,
                    padding: EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.film_fill,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8,),
                            Text(
                              "Vở kịch: ${title}",
                                style: TextStyle(fontSize: 16.0, color: Colors.white),
                            )
                          ],
                        ),
                        Divider(height: 2.0),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.ticket_fill,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8,),
                            Text(
                              'Chỗ ngồi đã lựa chọn: ${selectedSeats.toString()}',
                              style: TextStyle(fontSize: 16.0, color: Colors.white),
                            ),
                          ],
                        ),

                        Divider(height: 2.0),
                        Row(
                          children: [
                            Icon(
                              Icons.money,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8,),
                            Text(
                              'Số tiền phải trả: ${NumberFormat("###,###,###").format(payment)} đồng',
                              style: TextStyle(fontSize: 16.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add functionality to hide this widget if needed
                      },

                      child: Text('Thanh toán', style: TextStyle(color: Color(0xffA12830)),),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            // Change your radius here
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white70)
                      ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeatNumber {
  final int rowI;
  final int colI;

  final String rows = "ABCDEFGHIKLMNOPQRSTVUWXYZ";
  const SeatNumber({required this.rowI, required this.colI});

  @override
  bool operator ==(Object other) {
    return rowI == (other as SeatNumber).rowI && colI == (other as SeatNumber).colI;
  }

  @override
  int get hashCode => rowI.hashCode;

  @override
  String toString() {
    return '${rows[rowI]}$colI';
  }
}