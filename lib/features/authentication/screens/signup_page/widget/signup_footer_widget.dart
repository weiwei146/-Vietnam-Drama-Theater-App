import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/signin_controller.dart';
import '../../login_page/login_page.dart'; // Import màn hình đăng nhập

class SignUpFooterWidget extends StatelessWidget {
  SignUpFooterWidget({
    Key? key,
  }) : super(key: key);
  final controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hoặc",
          style: Theme.of(context).textTheme.labelSmall,
        ),
        SizedBox(height: 5),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              controller.googleSignIn();
            },
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              padding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
              side: BorderSide(color: Colors.red),
            ),
            icon: const Image(
              image: AssetImage("assets/images/google.png"),
              width: 20.0,
            ),
            label: Text(
              "Đăng nhập với Google",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      LoginScreen()), // Điều hướng đến màn hình đăng nhập
            );
          },
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Đã có tài khoản?",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                TextSpan(
                  text: " Đăng nhập ngay",
                  style: GoogleFonts.montserrat(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
