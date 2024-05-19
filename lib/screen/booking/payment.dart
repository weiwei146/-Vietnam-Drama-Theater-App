import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:namer_app/screen/booking/inforPayment.dart';
import 'package:selectable_box/selectable_box.dart';

import '../../features/authentication/controllers/profile_controller.dart';
import 'BookingScreen.dart';

class PaymentScreen extends StatefulWidget {
  final String title;
  final String scheduleID;
  final String selectedSeats;
  final Set<SeatNumber> slots;
  final int payment;
  const PaymentScreen({Key? key, required this.title, required this.selectedSeats, required this.payment, required this.scheduleID, required this.slots})  : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isCardSelected = true;

  void selectPaymentMethod(bool isCard) {
    setState(() {
      isCardSelected = isCard;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thanh toán',
        style: TextStyle(
          fontSize: 18,
            color: Colors.white),
      ),
        backgroundColor: Color(0xffA12830)),
      body : SingleChildScrollView(
      child: Column(
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
                      color: Color(0xffA12830),
                    ),
                    SizedBox(width: 8,),
                    Text(
                      "Vở kịch: ${widget.title}",
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    )
                  ],
                ),
                Divider(height: 2.0),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.ticket_fill,
                      color: Color(0xffA12830),
                    ),
                    SizedBox(width: 8,),
                    Text(
                      'Chỗ ngồi đã lựa chọn: ${widget.selectedSeats.toString()}',
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ],
                ),

                Divider(height: 2.0),
                Row(
                  children: [
                    Icon(
                      Icons.money,
                      color: Color(0xffA12830),
                    ),
                    SizedBox(width: 8,),
                    Text(
                      'Số tiền phải trả: ${NumberFormat("###,###,###").format(widget.payment)} đồng',
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 4.0),
          Center(
            child: Column(
              children: [
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 10),
                  Icon(
                    Icons.money,
                    color: Color(0xffA12830),
                  ),
                  SizedBox(width: 8,),
                  Text(
                    'Voucher bạn sở hữu',
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  Spacer(),
                  IconButton(
                    color: Color(0xffA12830),
                    iconSize: 20,
                    onPressed: () {
                    },
                    icon: const Icon(Icons.navigate_next),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ],
            ),
          ),
          Divider(height: 4.0),
          SizedBox(height: 20),
          Center(
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.payment,
                        color: Color(0xffA12830),
                      ),
                      SizedBox(width: 8,),
                      Text(
                        'Phương thức thanh toán',
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      height: 100,
                      width: 300,
                      child: SelectableBox(
                        onTap: () => selectPaymentMethod(true),
                        isSelected: isCardSelected,
                        child: Row(
                          children: [
                            SizedBox(width: 30),
                            Icon(Icons.credit_card, color: Colors.black),
                            SizedBox(width: 30),
                            Text("Thanh toán bằng thẻ"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 100,
                      width: 300,
                      child: SelectableBox(
                        onTap: () => selectPaymentMethod(false),
                        isSelected: !isCardSelected,
                        child: Row(
                          children: [
                            SizedBox(width: 30),
                            Icon(Icons.credit_card, color: Colors.black),
                            SizedBox(width: 30),
                            Text("Thanh toán bằng Momo"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 4.0),
          SizedBox(height: 20),
          Center(
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.payment,
                        color: Color(0xffA12830),
                      ),
                      SizedBox(width: 8,),
                      Text(
                        'Chi tiết thanh toán',
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              "Tổng tiền vé: ",
                              style: TextStyle(fontSize: 16.0, color: Colors.black),
                            ),
                            Spacer(),
                            Text(
                              "${widget.payment}",
                              style: TextStyle(fontSize: 16.0, color: Colors.black),
                            ),
                          ],
                        ),
                        Divider(height: 2.0),
                        Row(
                          children: [
                            Text(
                              'Giảm giá voucher:',
                              style: TextStyle(fontSize: 16.0, color: Colors.black),
                            ),
                            Spacer(),
                            Text(
                              '0',
                              style: TextStyle(fontSize: 16.0, color: Colors.black),
                            ),
                          ],
                        ),
                        Divider(height: 2.0),
                        Row(
                          children: [
                            Text(
                              'Tổng thanh toán:',
                              style: TextStyle(fontSize: 20.0, color: Colors.black),
                            ),
                            Spacer(),
                            Text(
                              '${NumberFormat("###,###,###").format(widget.payment)}',
                              style: TextStyle(fontSize: 20.0, color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(height: 4.0),
          SizedBox(height: 20),
          Center(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text("Nhấn 'Xác nhận thanh toán' thì không thể hoàn trả, nhà bán vé không chịu trách nhiệm với trường hợp này."),
            ),
          ),
          SizedBox(height: 50),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformationPayment(typePayment: isCardSelected, selectedSeats: widget.slots, id: widget.scheduleID, payment: widget.payment,)),
                );
              },

              child: Text('Xác nhận thanh toán', style: TextStyle(color: Color(0xffA12830)),),
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
      )
      )
    );
  }
}

