import 'package:flutter/material.dart';
import 'package:namer_app/constants/sizes.dart';
import 'package:namer_app/features/authentication/screens/login_page/widget/login_footer_widget.dart';
import 'package:namer_app/features/authentication/screens/login_page/widget/login_form_widget.dart';
import 'package:namer_app/features/authentication/screens/login_page/widget/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                LoginHeaderWidget(),
                LoginForm(),
                LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
