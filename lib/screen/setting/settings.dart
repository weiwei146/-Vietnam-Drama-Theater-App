import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:namer_app/features/authentication/screens/login_page/login_page.dart';
import 'package:namer_app/screen/setting/widget/profile_widget.dart';

import '../../constants/image_strings.dart';
import '../../constants/sizes.dart';
import '../../repository/authentication_repository/authentication_repository.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final User? user = AuthenticationRepository.instance.firebaseUser.value;
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cài đặt",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(true ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize - 10),
          child: Column(
            children: [
              _buildUserInfo(user, context),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: "Cài đặt hệ thống",
                icon: LineAwesomeIcons.cog,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Thông tin thanh toán",
                icon: LineAwesomeIcons.wallet,
                onPress: () {},
              ),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: "Thông tin ứng dụng",
                icon: LineAwesomeIcons.info,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Đăng xuất",
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {
                  Get.defaultDialog(
                    title: "Đăng xuất",
                    titleStyle: const TextStyle(fontSize: 20),
                    content: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text("Bạn chắc chắn muốn đăng xuất?"),
                    ),
                    confirm: Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          AuthenticationRepository.instance.logout();
                          Get.off(Settings());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          side: BorderSide.none,
                        ),
                        child: const Text("Có"),
                      ),
                    ),
                    cancel: OutlinedButton(
                      onPressed: () => Get.back(),
                      child: const Text("Không"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo(User? user, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        if (user != null) ...[
          Stack(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(theaterSplashImage),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red,
                  ),
                  child: const Icon(
                    LineAwesomeIcons.alternate_pencil,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('User Name: ${user.displayName ?? ''}'),
              Text('User Email: ${user.email ?? ''}'),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.off(Settings());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                  ),
                  child: Text(
                    "Chỉnh sửa",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ],
          ),
        ] else
          OutlinedButton(
            onPressed: () {
              Get.to(() => LoginScreen());
            },
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              padding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
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
      ],
    );
  }
}
