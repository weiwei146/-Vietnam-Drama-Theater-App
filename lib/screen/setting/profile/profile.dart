import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:namer_app/constants/image_strings.dart';
import 'package:namer_app/screen/setting/profile/update_password.dart';
import 'package:namer_app/screen/setting/profile/update_profile.dart';
import 'package:namer_app/screen/setting/profile/widget/profile_menu.dart';

import '../../../common/widget/appbar.dart';
import '../../../common/widget/section_heading.dart';
import '../../../features/authentication/controllers/profile_controller.dart';
import '../../../features/authentication/models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key, required this.didPop});
  void Function() didPop;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = Get.put(ProfileController());
  final ImagePicker imagePicker = ImagePicker();

  late String userAvatarURL = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: const Text('Hồ sơ'),
        showBackArrow: true,
        backOnPress: () {
          widget.didPop();
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder<UserModel?>(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final data = snapshot.data!;
                  userAvatarURL = theaterSplashImage;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Profile picture
                      ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.asset(theaterSplashImage),
                      ),
                      const SizedBox(height: 5),
                      TextButton(
                        onPressed: () async {
                          final XFile? pickedFile = await imagePicker.pickImage(
                              source: ImageSource.gallery);

                          if (pickedFile != null) {
                            SmartDialog.showLoading();
                            String uniqueFileName =
                                '${DateTime.now().millisecondsSinceEpoch}.jpg';

                            // Placeholder for the actual upload logic
                            // String newImageUrl = await uploadImage(File(pickedFile.path), uniqueFileName);

                            // Simulated new image URL
                            String newImageUrl =
                                "https://example.com/path/to/$uniqueFileName";

                            UserModel updatedUser = UserModel(
                              id: data.id,
                              name: data.name,
                              email: data.email,
                              phoneNumber: data.phoneNumber,
                              password: data.password,
                            );

                            await controller.updateUser(updatedUser);

                            setState(() {
                              userAvatarURL = newImageUrl;
                            });

                            SmartDialog.dismiss();
                          } else {
                            Get.snackbar(
                              'Thông báo',
                              'Chưa chọn ảnh',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red.withOpacity(0.1),
                              colorText: Colors.redAccent,
                              duration: const Duration(seconds: 1),
                            );
                          }
                        },
                        child: const Text(
                          'Đổi ảnh đại diện',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.redAccent),
                      const SizedBox(height: 10),
                      const TSectionHeading(
                        title: 'Thông tin hồ sơ',
                        showActionButton: false,
                      ),
                      const SizedBox(height: 10),
                      TProfileMenu(
                        onPressed: () {},
                        title: 'Tên đầy đủ',
                        value: data.name,
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Colors.redAccent),
                      const SizedBox(height: 10),
                      const TSectionHeading(
                        title: 'Thông tin cá nhân',
                        showActionButton: false,
                      ),
                      const SizedBox(height: 10),
                      TProfileMenu(
                        onPressed: () {},
                        title: 'Email',
                        value: data.email,
                      ),
                      TProfileMenu(
                        onPressed: () {},
                        title: 'Số điện thoại',
                        value: data.phoneNumber!,
                      ),
                      TProfileMenu(
                        onPressed: () {},
                        title: 'Giới tính',
                        value: 'None',
                      ),
                      TProfileMenu(
                        onPressed: () {},
                        title: 'Ngày sinh',
                        value: '01/01/1970',
                      ),
                      const Divider(color: Colors.redAccent),
                      const SizedBox(height: 10),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Get.to(() => ProfileUpdateScreen(
                                  didPop: () {},
                                )); // Navigate to the profile update screen
                          },
                          child: const Text(
                            'Sửa đổi thông tin',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      if (controller.getProviderId() != 'google.com' &&
                          controller.getProviderId() != 'facebook.com')
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => PasswordUpdateScreen(
                                    didPop: () {},
                                  )); // Navigate to the password update screen
                            },
                            child: const Text(
                              'Đổi mật khẩu',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
