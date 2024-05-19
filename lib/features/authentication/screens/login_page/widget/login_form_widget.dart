import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/features/authentication/controllers/signin_controller.dart';
import 'package:namer_app/features/authentication/screens/forgot_password/forgot_password_screen.dart';
import 'package:namer_app/features/authentication/screens/forgot_password/widget/forgot_password_widget.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../screen/setting/profile/settings.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback? didPop;

  const LoginForm({Key? key, this.didPop}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final controller = Get.put(SignInController());
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: "Email",
                hintText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: controller.password,
              validator: (value) {
                if (value!.isEmpty) return 'Nhập mật khẩu';
                return null;
              },
              obscureText: !showPassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: "Mật khẩu",
                hintText: "Mật khẩu",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(tDefaultSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Lựa chọn",
                              style: Theme.of(context).textTheme.titleMedium),
                          Text(
                              "Lựa chọn phương thức bạn sẽ nhận thông tin thay đổi mật khẩu",
                              style: Theme.of(context).textTheme.labelLarge),
                          const SizedBox(height: 30.0),
                          ForgetPasswordBtnWidget(
                            onTap: () {
                              Navigator.pop(context);
                              Get.to(() => const ForgetPasswordMailScreen());
                            },
                            title: "Email",
                            subTitle: "Thay đổi mật khẩu bằng email",
                            btnIcon: Icons.mail_outline_rounded,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Text(
                  "Quên mật khẩu?",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                ),
                onPressed: () async {
                  await controller.signIn(
                      controller.email.text, controller.password.text);
                  Navigator.of(context)
                      .pop(); // Close the login screen on success
                  if (widget.didPop != null)
                    widget.didPop!(); // Call the didPop callback
                  navigateSettingsPage();
                  // Show an error message if login fails
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text(
                  //         'Đăng nhập không thành công. Vui lòng thử lại.'),
                  //   ),
                },
                child: Text(
                  "Đăng nhập".toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateSettingsPage() {
    Route route = MaterialPageRoute(builder: (context) => Settings());
    Navigator.push(context, route).then((value) {
      if (widget.didPop != null) widget.didPop!();
    });
  }
}
