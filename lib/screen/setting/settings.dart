import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:namer_app/constants/image_strings.dart';
import 'package:namer_app/constants/sizes.dart';
import 'package:namer_app/screen/setting/widget/profile_widget.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text("Cài đặt", style: Theme.of(context).textTheme.titleMedium),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize - 10),
          child: Column(
            children: [
              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:
                            const Image(image: AssetImage(theaterSplashImage))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.red),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text("Nghin", style: Theme.of(context).textTheme.titleMedium),
              Text("nghinn1012@gmail.com",
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                  ),
                  child: Text(
                    "Chỉnh sửa",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),

              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(
                  title: "Cài đặt hệ thống",
                  icon: LineAwesomeIcons.cog,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Thông tin thanh toán",
                  icon: LineAwesomeIcons.wallet,
                  onPress: () {}),
              // ProfileMenuWidget(
              //     title: "User Management",
              //     icon: LineAwesomeIcons.user_check,
              //     onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Thông tin ứng dụng",
                  icon: LineAwesomeIcons.info,
                  onPress: () {}),
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
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              side: BorderSide.none),
                          child: const Text("Có"),
                        ),
                      ),
                      cancel: OutlinedButton(
                          onPressed: () => Get.back(),
                          child: const Text("Không")),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
