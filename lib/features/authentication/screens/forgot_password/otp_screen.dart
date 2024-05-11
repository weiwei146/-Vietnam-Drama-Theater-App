import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/sizes.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "MÃ XÁC NHẬN",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 50.0),
            ),
            // Text("Xác thực".toUpperCase(),
            //     style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 40.0),
            const Text("Điền mã xác thực được gửi tới nghinn1012@gmail.com",
                textAlign: TextAlign.center),
            const SizedBox(height: 20.0),
            OtpTextField(
                mainAxisAlignment: MainAxisAlignment.center,
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code) => print("OTP is => $code")),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child:
                  ElevatedButton(onPressed: () {}, child: const Text("Next")),
            ),
          ],
        ),
      ),
    );
  }
}
