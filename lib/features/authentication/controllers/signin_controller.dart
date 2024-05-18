import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../models/user_model.dart';

class SignInController extends GetxController {
  var controller = Get.put(AuthenticationRepository());
  var userRepo = Get.put(UserRepository());
  static SignInController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  /// TextField Validation
  @override
  void onReady() {
    super.onReady();
  }

  //Call this Function from Design & it will do the rest
  Future<void> signIn(String email, String password) async {
    await AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
  }

  Future<void> googleSignIn() async {
    try {
      final auth = AuthenticationRepository.instance;
      await auth.signInWithGoogle();
      final names = auth.firebaseUser?.value!.displayName!;

      final model = UserModel(
        name: names ?? 'test',
        email: auth.firebaseUser?.value?.email! ?? 'test00@gmail.com',
        phoneNumber: auth.firebaseUser?.value!.phoneNumber ?? '000000000',
      );
      if (!await userRepo.isEmailExisted(model.email)) {
        userRepo.createUser(model);
      }
    } catch (e) {
      Get.snackbar(
        'Lỗi',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      if (kDebugMode) {
        print(e.toString());
      }
      GoogleSignIn().signOut();
    }
  }
}
