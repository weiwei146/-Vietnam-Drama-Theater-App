import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:namer_app/features/authentication/controllers/settings_controller.dart';
import 'package:namer_app/features/authentication/models/user_model.dart';
import 'package:namer_app/screen/setting/profile/profile.dart';
import 'package:namer_app/screen/setting/widget/profile_widget.dart';

import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../features/authentication/screens/login_page/login_page.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final SettingsController _settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cài đặt",
          style: Theme.of(context).textTheme.titleMedium!,
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Implement your light/dark mode toggle logic here
            },
            icon: Icon(LineAwesomeIcons
                .sun), // or LineAwesomeIcons.moon based on logic
          ),
        ],
      ),
      body: FutureBuilder<UserModel?>(
        future: _settingsController.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null) {
            return _buildNotLoggedInView(context);
          } else {
            UserModel user = snapshot.data!;
            return _buildLoggedInView(context, user);
          }
        },
      ),
    );
  }

  Widget _buildNotLoggedInView(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Image.network(
          'https://i.pinimg.com/564x/6b/66/51/6b6651cb9ca25ae29beea9502381f349.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        // Blur effect
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
        ),
        // Main content
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize - 10),
            child: Column(
              children: [
                Center(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.to(() => LoginScreen());
                    },
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
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 10),
                Column(
                  children: [
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoggedInView(BuildContext context, UserModel user) {
    return Stack(
      children: [
        // Background image
        Image.network(
          'https://i.pinimg.com/564x/6b/66/51/6b6651cb9ca25ae29beea9502381f349.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        // Blur effect
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
        ),
        // Main content
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize - 10),
            child: Column(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 140,
                            height: 140,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(120),
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
                      const SizedBox(height: 10),
                      Text(
                        '${user.name}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        '${user.email}',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to profile update screen
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
                            style: Theme.of(context).textTheme.labelMedium!,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Column(
                  children: [
                    ProfileMenuWidget(
                      title: "Xem hồ sơ",
                      icon: LineAwesomeIcons.cog,
                      onPress: () {
                        Get.to(() => ProfileScreen(
                              didPop: () {},
                            ));
                      },
                    ),
                    ProfileMenuWidget(
                      title: "Phương thức thanh toán",
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
                          confirm: ElevatedButton(
                            onPressed: () {
                              AuthenticationRepository.instance.logout();
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              side: BorderSide.none,
                            ),
                            child: const Text("Có"),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
