import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widget/appbar.dart';
import '../../../features/authentication/controllers/profile_controller.dart';
import '../../../features/authentication/models/user_model.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({Key? key, required this.didPop}) : super(key: key);

  final void Function() didPop;

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final controller1 = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text(
          'Thay đổi thông tin',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: FutureBuilder(
            future: controller1.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userModel = snapshot.data as UserModel;

                  //Controllers
                  final email = TextEditingController(text: userModel.email);
                  final name = TextEditingController(text: userModel.name);
                  final phoneNumber =
                      TextEditingController(text: userModel.phoneNumber);

                  return Column(
                    children: [
                      /// -- Form Fields
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: userModel.email,
                              enabled: false,
                              decoration: const InputDecoration(
                                label: Text('Email'),
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            const SizedBox(height: 32),
                            TextFormField(
                              controller: name,
                              decoration: const InputDecoration(
                                label: Text('Name'),
                                prefixIcon: Icon(Iconsax.user),
                              ),
                            ),
                            const SizedBox(height: 32),
                            TextFormField(
                              controller: phoneNumber,
                              decoration: const InputDecoration(
                                label: Text('PhoneNumber'),
                                prefixIcon: Icon(Icons.phone),
                              ),
                            ),
                            const SizedBox(height: 32),
                            // TextFormField(
                            //   controller: password,
                            //   //obscureText: true, thử đi
                            //   decoration: const InputDecoration(
                            //     label: Text('Password'), prefixIcon: Icon(Iconsax.password_check),
                            //   ),
                            // ),
                            // const SizedBox(height: 32),

                            /// -Form Submit Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final userData = UserModel(
                                    id: userModel.id,
                                    email: email.text.trim(),
                                    phoneNumber: phoneNumber.text.trim(),
                                    name: name.text.trim(),
                                  );

                                  await controller1.updateUser(userData);
                                  // Navigator.pop(context,
                                  //     MaterialPageRoute(builder: (context) => ProfileScreen()));
                                  // ignore: use_build_context_synchronously
                                  widget.didPop();
                                  // ignore: use_build_context_synchronously
                                  Navigator.pop(context);
                                },
                                // style: ElevatedButton.styleFrom(
                                //   backgroundColor: TColors.primary,
                                //   side: BorderSide.none,
                                //   shape: const StadiumBorder(),
                                // ),
                                child: const Text('Cập nhật',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
