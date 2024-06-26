import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/constants/sizes.dart';
import 'package:namer_app/features/authentication/screens/signup_page/signup_page.dart';

import '../../../../../screen/setting/profile/settings.dart';
import '../../../controllers/signin_controller.dart';

class LoginFooterWidget extends StatelessWidget {
  LoginFooterWidget({Key? key, this.didPop}) : super(key: key);

  final controller = Get.put(SignInController());
  final VoidCallback? didPop;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Hoặc",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: tFormHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              side: BorderSide(color: Colors.red),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            ),
            icon: const Image(
              image: AssetImage("assets/images/google.png"),
              width: 20.0,
            ),
            onPressed: () {
              controller.googleSignIn();
              Navigator.of(context)
                  .pop(); // Close the sign-up screen on success
              navigateSettingsPage(context);
            },
            label: Text(
              "Đăng nhập với Google",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
        const SizedBox(height: tFormHeight - 20),
        TextButton(
          onPressed: () => Get.to(() => SignUpScreen()),
          child: Text.rich(
            TextSpan(
              text: "Chưa có tài khoản?",
              style: Theme.of(context).textTheme.labelLarge,
              children: const [
                TextSpan(
                  text: "Đăng ký",
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void navigateSettingsPage(BuildContext context) {
    Route route = MaterialPageRoute(builder: (context) => Settings());
    Navigator.push(context, route).then((value) {
      if (didPop != null) didPop!();
    });
  }
}
