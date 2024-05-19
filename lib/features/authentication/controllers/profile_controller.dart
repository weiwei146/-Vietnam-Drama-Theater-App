import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  //Repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  var showPassword = false.obs;
  var showNewPassword = false.obs;
  var showRetypePassword = false.obs;

  getAuRepo() {
    return _authRepo;
  }

  getUserData() {
    final email = _authRepo.firebaseUser?.value?.email;
    if (email != null) {
      _authRepo.updateSigninStatus(true);
      return _userRepo.getUserDetails(email);

    } else {
      Get.snackbar('Lỗi', 'Bạn phải đăng nhập để tiếp tục');
    }
  }

  String getUserID() {
    final uid = _authRepo.firebaseUser?.value!.uid;
    if (uid != null) {
      _authRepo.updateSigninStatus(true);
      return uid;
    } else {
      Get.snackbar('Lỗi', 'Bạn phải đăng nhập để tiếp tục');
      return '';
    }
  }

  String getProviderId() {
    final info = FirebaseAuth.instance.currentUser!.providerData.first;
    return info.providerId;
  }

  updateUser(UserModel userModel) async {
    await _userRepo.updateUserDetail(userModel);
  }

  Future<void> updatePassword(UserModel userModel) async {
    await _userRepo.updatePassword(userModel);
  }
}
