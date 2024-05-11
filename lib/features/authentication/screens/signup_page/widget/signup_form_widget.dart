import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/constants/sizes.dart';
import 'package:namer_app/features/authentication/controllers/signup_controller.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.displayName,
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
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      SignUpController.instance.registerUser(
                          controller.email.text.trim(),
                          controller.password.text.trim());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Màu nền đỏ
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(0), // Làm phẳng các góc
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                  ),
                  child: Text(
                    "Đăng ký".toUpperCase(),
                    style: Theme.of(context).textTheme.labelMedium,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
