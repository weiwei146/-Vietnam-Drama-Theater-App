import 'package:flutter/material.dart';
import 'package:namer_app/constants/image_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage(theaterLoginImage),
          height: size.height * 0.2,
          width: size.width,
        ),
        SizedBox(
          height: 20,
        ),
        Text("Đăng nhập".toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge),
        // Text("Chào mừng bạn quay trờ lại",
        //     style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}
