import 'package:flutter/material.dart';
import 'package:namer_app/common/form/form_header_widget.dart';
import 'package:namer_app/constants/image_strings.dart';
import 'package:namer_app/constants/sizes.dart';
import 'package:namer_app/features/authentication/screens/signup_page/widget/signup_footer_widget.dart';
import 'package:namer_app/features/authentication/screens/signup_page/widget/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: const [
                FormHeaderWidget(
                  image: theaterLoginImage,
                  title: "ĐĂNG KÝ",
                  subTitle: "Hi",
                  imageHeight: 0.15,
                ),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
