import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../models/user_model.dart';

class SettingsController extends GetxController {
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  Future<UserModel?> getUserData() async {
    final email = _authRepo.firebaseUser?.value?.email;
    if (email != null) {
      return await _userRepo.getUserDetails(email);
    } else {
      return null;
    }
  }
}
