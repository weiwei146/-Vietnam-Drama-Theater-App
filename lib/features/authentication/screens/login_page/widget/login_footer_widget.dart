import 'package:flutter/material.dart';
import 'package:namer_app/constants/sizes.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

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
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
            icon: const Image(
                image: AssetImage("assets/images/google.png"), width: 20.0),
            onPressed: () {},
            label: Text(
              "Đăng nhập với Google",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
        const SizedBox(height: tFormHeight - 20),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
                text: "Chưa có tài khoản?",
                style: Theme.of(context).textTheme.labelLarge,
                children: const [
                  TextSpan(
                      text: "Đăng ký", style: TextStyle(color: Colors.blue))
                ]),
          ),
        ),
      ],
    );
  }
}
