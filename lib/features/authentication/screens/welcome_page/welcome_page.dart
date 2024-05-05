import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namer_app/constants/image_strings.dart';
import 'package:namer_app/features/authentication/screens/login_page/login_page.dart';
import 'package:namer_app/features/authentication/screens/signup_page/signup_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black54 : Colors.white,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(theaterSplashImage),
              height: height * 0.4,
            ),
            Column(
              children: [
                Text(
                  "Nhà hát Kịch Việt Nam",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Đưa văn hoá kịch truyền thống đến \n với người hiện đại trong tầm tay",
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Đặt hai nút vào chính giữa
              children: [
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.32, // Đặt độ dài của nút tại đây
                  child: OutlinedButton(
                    onPressed: () => Get.to(LoginScreen()),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                      side: BorderSide(color: Colors.red),
                    ),
                    child: Text(
                      "ĐĂNG NHẬP",
                      style: GoogleFonts.montserrat(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15.0), // Khoảng cách giữa hai nút
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.32, // Đặt độ dài của nút tại đây
                  child: ElevatedButton(
                    onPressed: () => Get.to(SignUpScreen()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      side: BorderSide(color: Colors.red),
                      padding:
                          EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                    ),
                    child: Text(
                      "ĐĂNG KÝ",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
