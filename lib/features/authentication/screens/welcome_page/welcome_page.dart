import 'package:flutter/material.dart';
import 'package:namer_app/constants/image_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(theaterSplashImage),
            ),
            Text("Ứng dụng Nhà hát Kịch Việt Nam"),
            Text("Tham gia ngay để trải nghiệm những hoạt động đặc sắc"),
          ],
        ),
      ),
    );
  }
}
