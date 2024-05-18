import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widget/appbar.dart';
import '../../../features/authentication/controllers/profile_controller.dart';
import '../../../features/authentication/models/user_model.dart';
import '../../../utlis/validation.dart';

class PasswordUpdateScreen extends StatefulWidget {
  const PasswordUpdateScreen({Key? key, required this.didPop})
      : super(key: key);

  final void Function() didPop;

  @override
  State<PasswordUpdateScreen> createState() => _PasswordUpdateScreenState();
}

class _PasswordUpdateScreenState extends State<PasswordUpdateScreen> {
  final ProfileController _profileController = Get.put(ProfileController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Đổi mật khẩu'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: FutureBuilder<UserModel?>(
            future: _profileController.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userModel = snapshot.data as UserModel;

                  // Controllers
                  final oldPasswordController = TextEditingController();
                  final newPasswordController = TextEditingController();
                  final retypePasswordController = TextEditingController();

                  return Column(
                    children: [
                      /// -- Form Fields
                      Obx(
                        () => Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: oldPasswordController,
                                obscureText:
                                    !_profileController.showPassword.value,
                                validator: (value) =>
                                    TValidator.validateOldPassword(
                                        value, userModel.password),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  label: const Text('Old Password'),
                                  prefixIcon:
                                      const Icon(Iconsax.password_check),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        _profileController.showPassword.value
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                    onPressed: () {
                                      _profileController.showPassword.value =
                                          !_profileController
                                              .showPassword.value;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),
                              TextFormField(
                                controller: newPasswordController,
                                obscureText:
                                    !_profileController.showNewPassword.value,
                                validator: TValidator.validatePassword,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  label: const Text('New Password'),
                                  prefixIcon:
                                      const Icon(Iconsax.password_check),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        _profileController.showNewPassword.value
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                    onPressed: () {
                                      _profileController.showNewPassword.value =
                                          !_profileController
                                              .showNewPassword.value;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),
                              TextFormField(
                                controller: retypePasswordController,
                                obscureText: !_profileController
                                    .showRetypePassword.value,
                                validator: (value) =>
                                    TValidator.validateRetypePassword(
                                        value, newPasswordController.text),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  label: const Text('Retype Password'),
                                  prefixIcon:
                                      const Icon(Iconsax.password_check),
                                  suffixIcon: IconButton(
                                    icon: Icon(_profileController
                                            .showRetypePassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      _profileController
                                              .showRetypePassword.value =
                                          !_profileController
                                              .showRetypePassword.value;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),

                              /// -Form Submit Button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      final updatedUser = UserModel(
                                        id: userModel.id,
                                        name: userModel.name,
                                        email: userModel.email,
                                        phoneNumber: userModel.phoneNumber,
                                        password:
                                            newPasswordController.text.trim(),
                                      );

                                      await _profileController
                                          .updateUser(updatedUser);
                                      await _profileController
                                          .updatePassword(updatedUser);
                                      widget.didPop();
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text('Cập nhật mật khẩu'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: Text('User data not found'));
                }
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
