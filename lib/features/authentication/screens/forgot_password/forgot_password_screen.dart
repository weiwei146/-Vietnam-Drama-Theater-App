import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/constants/image_strings.dart';
import 'package:namer_app/features/authentication/screens/forgot_password/otp_screen.dart';

import '../../../../common/form/form_header_widget.dart';
import '../../../../constants/sizes.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const SizedBox(height: tDefaultSize * 4),
                FormHeaderWidget(
                  image: theaterSplashImage,
                  title: "Quên mật khẩu".toUpperCase(),
                  subTitle: "Điền thông tin để tiếp tục đặt lại mật khẩu",
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: tFormHeight),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Email"),
                            hintText: "Email",
                            prefixIcon: Icon(Icons.mail_outline_rounded)),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () => Get.to(() => OTPScreen()),
                              child: const Text("Tiếp tục"))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
