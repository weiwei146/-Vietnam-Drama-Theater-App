import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/constants/sizes.dart';
import 'package:namer_app/features/authentication/controllers/signup_controller.dart';

import '../../../../../screen/setting/profile/settings.dart';
import '../../../models/user_model.dart';

class SignUpFormWidget extends StatelessWidget {
  final VoidCallback? didPop;

  const SignUpFormWidget({
    Key? key,
    this.didPop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.name,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_rounded),
                labelText: "Tên đăng nhập",
                hintText: "Tên đăng nhập",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 22),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: "Email",
                hintText: "Email",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 22),
            TextFormField(
              controller: controller.phoneNumber,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: "Số điện thoại",
                hintText: "Số điện thoại",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 22),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: "Mật khẩu",
                hintText: "Mật khẩu",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    UserModel userModel = UserModel(
                      name: controller.name.text,
                      email: controller.email.text,
                      phoneNumber: controller.phoneNumber.text,
                      password: controller.password.text,
                    );
                    await SignUpController.instance.createUser(userModel);
                    if (didPop != null) didPop!();
                    Navigator.of(context)
                        .pop(); // Close the sign-up screen on success
                    navigateSettingsPage(context); // Pass the context here
                  } else {
                    // Show an error message if sign-up fails
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Đăng ký không thành công. Vui lòng thử lại.'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                ),
                child: Text(
                  "Đăng ký".toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateSettingsPage(BuildContext context) {
    Route route = MaterialPageRoute(builder: (context) => Settings());
    Navigator.push(context, route).then((value) {
      if (didPop != null) didPop!();
    });
  }
}
