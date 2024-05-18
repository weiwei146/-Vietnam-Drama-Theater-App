import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../models/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  var controller = Get.put(AuthenticationRepository());

  var userRepo = Get.put(UserRepository());
  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final phoneNumber = TextEditingController();

  //Call this Function from Design & it will do the rest
  Future<bool> registerUser(String email, String password) async {
    return await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  Future<bool> isDuplicateEmail() async {
    return controller.isDuplicateEmail();
  }

  createUser(UserModel userModel) async {
    if (await registerUser(userModel.email, userModel.password!)) {
      userRepo.createUser(userModel);
    }
  }
}
