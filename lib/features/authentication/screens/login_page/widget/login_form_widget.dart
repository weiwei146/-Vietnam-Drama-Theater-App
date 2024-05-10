import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/features/authentication/screens/forgot_password/widget/forgot_password_widget.dart';

import '../../../../../constants/sizes.dart';
import '../../../controllers/login_controller.dart';
import '../../forgot_password/forgot_password_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    bool showPassword =
        false; // Tạo một biến để lưu trạng thái hiển thị mật khẩu

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
                if (value!.isEmpty) return 'Enter your password';
                return null;
              },
              obscureText:
                  !showPassword, // Sử dụng biến showPassword để quyết định việc hiển thị mật khẩu
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: "Password",
                hintText: "Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    showPassword =
                        !showPassword; // Đảo ngược trạng thái hiển thị mật khẩu khi người dùng nhấn vào
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
                        borderRadius: BorderRadius.circular(20.0)),
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(tDefaultSize),
                      height: MediaQuery.of(context).size.height * 0.4,
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
                onPressed: () {
                  controller
                      .login(); // Gọi hàm login từ controller khi người dùng nhấn vào nút "Đăng nhập"
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
}
