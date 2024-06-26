import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:namer_app/screen/booking/BookingScreen.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../features/authentication/controllers/profile_controller.dart';
import '../../utlis/database/SlotDB.dart';

class InformationPayment extends StatefulWidget {
  final bool typePayment;
  final String id;
  final Set<SeatNumber> selectedSeats;
  final int payment;
  const InformationPayment({Key? key, required this.typePayment, required this.id, required this.selectedSeats, required this.payment})  : super(key: key);


  @override
  State<InformationPayment> createState() => _InformationPaymentState();
}

class _InformationPaymentState extends State<InformationPayment> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _expiryDateController = TextEditingController();
  final controller = Get.put(ProfileController());

  void _showPaymentSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Thanh toán thành công!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showPaymentFailMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Thanh toán không thành công!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void updateSlots() async {
    if(await SlotDB.updateSlots(widget.id, widget.selectedSeats, controller.getUserID())) {
      _showPaymentSuccessMessage();
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context);
      });
    } else {
      _showPaymentFailMessage();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Điền thông tin phương thức thanh toán', style: TextStyle(fontSize: 15.0, color: Colors.white)),
          backgroundColor: Color(0xffA12830)
      ),
      body: Center(
        child: widget.typePayment
            ? Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Họ và tên (Trên thẻ)'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _cardNumberController,
                decoration: InputDecoration(labelText: 'Số thẻ'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _expiryDateController,
                decoration: InputDecoration(labelText: 'Ngày phát hành'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      updateSlots();
                    },
                    child: Text('Xác nhận'),
                  ),
                ],
              )
            ],
          ),
        )
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QrImageView(
                    data: 'Thanh toán bằng QR',
                    version: QrVersions.auto,
                    size: 300.0,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Quét mã QR sau để thanh toán'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}