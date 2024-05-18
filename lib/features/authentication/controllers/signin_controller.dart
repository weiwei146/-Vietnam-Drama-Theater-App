import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/user_repository/user_repository.dart';

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
}
